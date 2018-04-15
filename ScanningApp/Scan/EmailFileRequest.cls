Class Scan.EmailFileRequest Extends Ens.Request
{
	Property ID as %Integer;
	Property Name as %String;
	Property ToAddress as %String (MAXLEN = 1000);
	Property EmailText as %String (MAXLEN = 1000);
	Property FileName as %String (MAXLEN =1000);
Storage Default
{
<Data name="EmailFileRequestDefaultData">
<Subscript>"EmailFileRequest"</Subscript>
<Value name="1">
<Value>ID</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>ToAddress</Value>
</Value>
<Value name="4">
<Value>EmailText</Value>
</Value>
<Value name="5">
<Value>FileName</Value>
</Value>
</Data>
<DefaultData>EmailFileRequestDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}