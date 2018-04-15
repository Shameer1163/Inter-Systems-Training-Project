Class Scan.AddAddressRequest Extends Ens.Request
{
	Property IsExternal as %Boolean;
	Property IsRelated as %Boolean;
	Property ToAddress as %String (MAXLEN = 1000);
	
Storage Default
{
<Data name="AddAddressRequestDefaultData">
<Subscript>"AddAddressRequest"</Subscript>
<Value name="1">
<Value>IsExternal</Value>
</Value>
<Value name="2">
<Value>IsRelated</Value>
</Value>
<Value name="3">
<Value>ToAddress</Value>
</Value>
</Data>
<DefaultData>AddAddressRequestDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}