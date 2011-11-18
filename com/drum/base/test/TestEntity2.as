package com.drum.base.test
{
	public class TestEntity2 extends TestEntity
	{
		public var a_:int = 0;
		public var b_:int=0;
		public var c_:int =0;
		public function TestEntity2(a:int,b:int,c:int)
		{
			super();
			this.a_ = a;
			this.b_ = b;
			this.c_ = c;
		}
		
		public override function get xml_label():String
		{
			return "TEST2";
		}
		
	}
}