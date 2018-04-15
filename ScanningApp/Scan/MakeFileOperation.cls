Class Scan.MakeFileOperation extends Ens.BusinessOperation {

Parameter ADAPTER = "EnsLib.File.OutboundAdapter";

Property Adapter As EnsLib.File.OutboundAdapter;

Parameter INVOCATION = "Queue";

Method EmailFile(pInput As Scan.EmailFileRequest, Output pOutput As Ens.Response) As %Status
{
	set tSC = $$$OK
	
	try{
		set tOut = $ZDATETIME($H) _ " " _ pInput.ID _ " " _ pInput.Name
		set tOut = tOut _ " " _ pInput.ToAddress _ " " _ pInput.EmailText
		
		set tSC = ..Adapter.PutLine(pInput.FileName,tOut)
		
	}
	catch ex{
		set tSC = ex.AsStatus()
	}
	
	return tSC
}

Method AddressFile(pInput As Scan.AddressFileRequest, Output pOutput As Ens.Response) As %Status
{
	set tSC = $$$OK
	
	try{
		set tOut = $ZDATETIME($H) _ " " _ pInput.ToAddress _ " " _ pInput.IsRelated
		set tOut = tOut _ " " _ pInput.IsExternal
		
		set tSC = ..Adapter.PutLine(pInput.FileName,tOut)
		
	}
	catch ex{
		set tSC = ex.AsStatus()
	}
	
	return tSC
}

XData MessageMap {
<MapItems>
    <MapItem MessageType="Scan.AddressFileRequest">
        <Method>AddressFile</Method>
    </MapItem>
    <MapItem MessageType="Scan.EmailFileRequest">
        <Method>EmailFile</Method>
    </MapItem>
</MapItems>
}

}