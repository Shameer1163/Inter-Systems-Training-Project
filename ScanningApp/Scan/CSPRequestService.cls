Class Scan.CSPRequestService extends Ens.BusinessService {

Parameter ADAPTER = "Ens.InboundAdapter";

Method OnProcessInput(pInput As %CSP.Request, Output pOutput As %RegisteredObject) As %Status
{
	set tSC = $$$OK
	
	try{
		set text = pInput.Get("EmailText")
		
		if $find(text, "gizmo") {
			//Create New Employee Request
			set msg = ##class(Scan.CheckEmployeeRequest).%New()
			set msg.Name = pInput.Get("Name")
			set msg.ID = pInput.Get("ID")
			set msg.ToAddress = pInput.Get("ToAddress")
			set msg.EmailText = pInput.Get("EmailText")
			
			//Send Request
			set tSC = ..SendRequestAsync("Scan.DetermineBlackList",msg)
		}
		else {
			//Create Address FIle Request
			set addressFileRequest = ##class(Scan.AddressFileRequest).%New()
			set addressFileRequest.IsExternal = 0
			set addressFileRequest.IsRelated = 0
			set addressFileRequest.ToAddress = pInput.Get("ToAddress")
			set addressFileRequest.FileName = "MyFile.txt"
			
			//Send Request
			set tSC = ..SendRequestAsync("Scan.MakeFileOperation",addressFileRequest)
		}
	}
	catch ex{
		set tSC = ex.AsStatus()
	}
	quit tSC
}

}