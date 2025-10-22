Class constructor
	
Function backup() : Object
	
	var $signal : 4D:C1709.Signal
	$signal:=New signal:C1641("BACKUP")
	
	CALL WORKER:C1389($signal.description; This:C1470._backup; $signal)
	
	$signal.wait()
	
	return {OK: $signal.OK}
	
Function backupInfo() : Object
	
	var $signal : 4D:C1709.Signal
	$signal:=New signal:C1641("BACKUP INFO")
	
	CALL WORKER:C1389($signal.description; This:C1470._backupInfo; $signal)
	
	$signal.wait()
	
	return {\
		lastBackupDate: $signal.lastBackupDate; \
		lastBackupTime: $signal.lastBackupTime; \
		lastBackupDuration: $signal.lastBackupDuration; \
		lastBackupBeginTimestamp: $signal.lastBackupBeginTimestamp; \
		lastBackupNumber: $signal.lastBackupNumber; \
		lastBackupStatus: $signal.lastBackupStatus; \
		nextBackupDate: $signal.nextBackupDate; \
		nextBackupTime: $signal.nextBackupTime}
	
Function _backup($signal : 4D:C1709.Signal)
	
	BACKUP:C887
	
	Use ($signal)
		$signal.OK:=OK
	End use 
	
	$signal.trigger()
	
Function _backupInfo($signal : 4D:C1709.Signal)
	
	var $lastBackupDate : Date
	var $lastBackupTime : Time
	BACKUP INFO:C888(Last backup date:K54:1; $lastBackupDate; $lastBackupTime)
	
	var $lastBackupDuration : Integer
	var $lastBackupBeginTimestamp : Text
	BACKUP INFO:C888(Last Backup information:K54:12; $lastBackupDuration; $lastBackupBeginTimestamp)
	
	var $lastBackupNumber : Integer
	var $lastBackupStatus : Text
	BACKUP INFO:C888(Last backup status:K54:2; $lastBackupNumber; $lastBackupStatus)
	
	var $nextBackupDate : Date
	var $nextBackupTime : Time
	BACKUP INFO:C888(Next backup date:K54:3; $nextBackupDate; $nextBackupTime)
	
	Use ($signal)
		$signal.lastBackupDate:=$lastBackupDate
		$signal.lastBackupTime:=$lastBackupTime
		$signal.lastBackupDuration:=$lastBackupDuration
		$signal.lastBackupBeginTimestamp:=$lastBackupBeginTimestamp
		$signal.lastBackupNumber:=$lastBackupNumber
		$signal.lastBackupStatus:=$lastBackupStatus
		$signal.nextBackupDate:=$nextBackupDate
		$signal.nextBackupTime:=$nextBackupTime
	End use 
	
	$signal.trigger()