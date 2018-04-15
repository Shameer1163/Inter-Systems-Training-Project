Class Scan.GetEmployeeDetails extends Ens.BusinessOperation {

Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Property Adapter As EnsLib.SQL.OutboundAdapter;

Parameter INVOCATION = "Queue";

Method CheckRelation(pInput As Scan.CheckRelationRequest, Output pOutput As Scan.CheckRelationResponse) As %Status
{
	set tSC = $$$OK
		
	try{
		set tSQL = "SELECT RELATIONSHIPTOOWNER FROM Employee WHERE ID = " _ pInput.ID
		set tSC = ..Adapter.ExecuteQuery(.tResult,tSQL)
		
		do tResult.Next()
		//Get the value
		set relation = tResult.GetData(1)
		
		set pOutput = ##class(Scan.CheckRelationResponse).%New()
		
		if (relation = "None"){
			set isRelated = 0
			}
		else {
			set isRelated = 1
		}
		
		set pOutput.IsRelated = isRelated
	}
	catch ex{
		set tSC = ex.AsStatus()
	}
	
	return tSC
}

Method ValidateToAddress(pInput As Scan.ValidateToAddressRequest, Output pOutput As Scan.ValidateToAddressResponse) As %Status
{
	set tSC = $$$OK
		
	try{
		set tSQL = "SELECT COUNT(ID) FROM Employee WHERE Email = '" _ pInput.ToAddress _ "'"
		set tSC = ..Adapter.ExecuteQuery(.tResult,tSQL)
		
		do tResult.Next()
		//Get the value
		set count = tResult.GetData(1)
		
		set pOutput = ##class(Scan.ValidateToAddressResponse).%New()
		if (count > 0) {
			set isExternal = 0
		}
		else {
			set isExternal = 1
		}
			
		set pOutput.IsExternal = isExternal
	}
	catch ex{
		set tSC = ex.AsStatus()
	}
	
	return tSC
}

XData MessageMap {
<MapItems>
    <MapItem MessageType="Scan.CheckRelationRequest">
        <Method>CheckRelation</Method>
    </MapItem>
    <MapItem MessageType="Scan.ValidateToAddressRequest">
        <Method>ValidateToAddress</Method>
    </MapItem>
</MapItems>
}

}