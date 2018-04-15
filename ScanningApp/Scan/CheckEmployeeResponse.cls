Class Scan.CheckEmployeeResponse Extends Ens.Response
{
	Property IsRelated as %Boolean;
	Property IsExternal as %Boolean;
Storage Default
{
<Data name="CheckEmployeeResponseDefaultData">
<Subscript>"CheckEmployeeResponse"</Subscript>
<Value name="1">
<Value>IsRelated</Value>
</Value>
<Value name="2">
<Value>IsExternal</Value>
</Value>
</Data>
<DefaultData>CheckEmployeeResponseDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}