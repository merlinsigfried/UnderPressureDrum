package com.drum.base.test
{
	import com.drum.base.entities.FPDrumEntity;
	import com.drum.base.entities.IDrumEntity;
	
	public class TestEntity extends FPDrumEntity
	{
		public function TestEntity()
		{
		}
		
		public override function get xml_label():String
		{
			return "TEST";
		}
		
		static public function get xml_label():String
		{
			return "TEST";
		}
	}
}