package com.drum.base.test
{
	import com.drum.base.entities.IDrumEntity;
	import com.drum.base.SEntityFactory;
	
	import flexunit.framework.Assert;
	
	public class EntityFactoryTest
	{	
		private var subject_:SEntityFactory = null;
		[Before]
		public function setUp():void
		{
			this.subject_ = SEntityFactory.Instance;
		}
		
		[After]
		public function tearDown():void
		{
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
			
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}
		
		[Test]
		public function testCreate():void
		{
			this.subject_.registerClass("TEST",TestEntity);
			var my_test:IDrumEntity = this.subject_.create("TEST");
			Assert.assertEquals("TEST",my_test.xml_label);
			this.subject_.registerClass("TEST2",TestEntity2);
			var my_test_2:IDrumEntity = this.subject_.create("TEST2",1,2,3);
			Assert.assertEquals("TEST2",my_test_2.xml_label);
			try
			{
				my_test_2 = this.subject_.create("FOO");
				Assert.fail("Esa etiqueta no habia sido registrada");
			}
			catch (e:ArgumentError)
			{
				
			}
		}
	}
}