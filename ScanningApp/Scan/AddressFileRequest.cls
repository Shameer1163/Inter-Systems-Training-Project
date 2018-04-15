Class Scan.AddressFileRequest Extends Ens.Request
{
	Property IsExternal as %Boolean;
	Property IsRelated as %Boolean;
	Property ToAddress as %String (MAXLEN = 1000);
	Property FileName as %String (MAXLEN = 1000);
	
Storage Default
{
<Data name="AddressFileRequestDefaultData">
<Subscript>"AddressFileRequest"</Subscript>
<Value name="1">
<Value>IsExternal</Value>
</Value>
<Value name="2">
<Value>IsRelated</Value>
</Value>
<Value name="3">
<Value>ToAddress</Value>
</Value>
<Value name="4">
<Value>FileName</Value>
</Value>
</Data>
<DefaultData>AddressFileRequestDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}