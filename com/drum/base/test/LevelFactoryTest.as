package com.drum.base.test
{
	import com.drum.base.SEntityFactory;
	import com.drum.base.SLevelFactory;
	import com.drum.base.worlds.DrumWorld;
	
	import flexunit.framework.Assert;

	public class LevelFactoryTest
	{		
		[Before]
		public function setUp():void
		{
		}
		
		[After]
		public function tearDown():void
		{
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
			SEntityFactory.Instance.registerClass("foo",TestEntity2);
			SEntityFactory.Instance.registerClass("faa",TestEntity);
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}
		
		[Test]
		public function testLoadXML():void
		{
			var test:XML = <xml>
								<foo x="30" y="40" z="50"/>
								<faa />
								<foo x="90" y="60" z="20"/>
							</xml>;
			var world:DrumWorld = new DrumWorld();
			SLevelFactory.loadWorld(test,world);
			var entities:Array = new Array();
			//Se ven las entidades dentro de mundo, pero getAll no las devuelve
			//si no se estan actualizando... parece ser un bug de FP
			Assert.assertEquals(3,world.count);
			Assert.assertEquals(2,world.classCount(TestEntity2));
		}	
	}
}