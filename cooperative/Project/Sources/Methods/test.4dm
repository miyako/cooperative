//%attributes = {"preemptive":"capable"}
#DECLARE($params : Object)

If (Count parameters:C259=0)
	
	CALL WORKER:C1389("test"; Current method name:C684; {})
	
Else 
	
	var $cooperative : cs:C1710.cooperative
	$cooperative:=cs:C1710.cooperative.new()
	var $status : Object
	
	$status:=$cooperative.backup()
	ALERT:C41(JSON Stringify:C1217($status; *))
	
	$status:=$cooperative.backupInfo()
	ALERT:C41(JSON Stringify:C1217($status; *))
	
End if 