# cooperative
Execute thread unsafe commands via a worker (namespace: `cooperative`)

## list of commands

|command|function name|
|-|-|
|`BACKUP`|backup|
|`BACKUP INFO`|backupInfo|

## usage

```4d
#DECLARE($params : Object)

If (Count parameters=0)
	
	CALL WORKER("test"; Current method name; {})
	
Else 
	
	var $info : Object
	$info:=Process info(Current process)
	
	ALERT(["current process"; "\""+$info.name+"\""; "is"; $info.preemptive ? "" : "not"; "preemptive"].join(" "))
	
	var $cooperative : cs.cooperative.cooperative
	$cooperative:=cs.cooperative.cooperative.new()
	var $status : Object
	
	$status:=$cooperative.backup()
	ALERT(JSON Stringify($status; *))
	
	$status:=$cooperative.backupInfo()
	ALERT(JSON Stringify($status; *))
	
End if
```
