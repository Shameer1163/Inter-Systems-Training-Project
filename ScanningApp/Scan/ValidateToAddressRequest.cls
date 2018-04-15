Class Scan.ValidateToAddressRequest Extends Ens.Request
{
	Property ToAddress as %String (MAXLEN= 1000);
Storage Default
{
<Data name="ValidateToAddressRequestDefaultData">
<Subscript>"ValidateToAddressRequest"</Subscript>
<Value name="1">
<Value>ToAddress</Value>
</Value>
</Data>
<DefaultData>ValidateToAddressRequestDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}