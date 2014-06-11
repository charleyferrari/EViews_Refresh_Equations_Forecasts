logmode +addin

%eqlist=@wlookup("*","equation")   'make a list of all equations in workfile %eqlist
!ownsmpl = 1

!result = @uidialog("caption","Equation refresh","edit",%eqlist,"Enter a list of equations to re-estimate",10000,"check",!ownsmpl,"Use original equation sample?")
if !result = -1 then 
	stop
endif
!maxerrs = @wcount(%eqlist) + 100
setmaxerrs !maxerrs

!haserror = 0
%errstorage = @getnextname("_errstorage")
svector(@wcount(%eqlist))  {%errstorage}

%s = @pagesmpl	'cache current smpl
for !i=1 to @wcount(%eqlist)     'cycle through the list one at a time
	%eq = @word(%eqlist,!i)  'current equation name
	'check current equation is actually an equation in the workfile
	if @isobject(%eq) = 0 then
		%msg = %eq + " is not a valid object."
		@uiprompt(%msg)
		stop
	endif
	'check that _this object is an equation
	if {%eq}.@type<>"EQUATION" then
		@uiprompt("Procedure can only be run from an Equation object")
		stop
	endif	
	
	%estcmd = {%eq}.@command  'current equation's estimation command		
	if !ownsmpl then
		%sm = {%eq}.@smpl
		smpl {%sm}
	endif
	!old_count = @errorcount
	{%eq}.{%estcmd}  're-estimate current equation with its command		
	!new_count = @errorcount
	
	if !new_count > !old_count then
		!haserror = 1		
		%eqerr = %eq + " caused an error."
		{%errstorage}(!i) = %eqerr
	else
		%eqerr = ""
		{%errstorage}(!i) = %eqerr		
	endif
next
!n = @rows({%errstorage})

if !haserror>0 then
	%err = @getnextname("_error")
	table(1,!n) {%err}
	!rowc=1
	{%err}(!rowc,1) = "Error reports"
	{%err}.setlines(a1:a1) +b
	!rowc=!rowc+2
	for !j=1 to !n
		if ({%errstorage}(!j)<>"") then
			{%err}(!rowc,1) = {%errstorage}(!j)
			!rowc=!rowc+1
		endif
	next
	show {%err}
endif

'set sample back.
smpl {%s}
delete {%errstorage}


