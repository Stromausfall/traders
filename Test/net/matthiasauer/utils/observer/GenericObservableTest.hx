package net.matthiasauer.utils.observer;
import haxe.unit.TestCase;

/**
 * ...
 * @author Matthias Auer
 */
class GenericObservableTest extends TestCase
{
	public function testAddObserverAndNotifyWorks()
	{
		// GIVEN:
		var id:String = "id#1";
		var test:Int = -1;
		var observable:GenericObservable<Int> = new GenericObservable<Int>();
		
		// WHEN:
		observable.add(id, function(num) { test = num; });
		observable.notify(99);
		
		// THEN:
		assertEquals(99, test);
	}
	
	public function testAddMultipleObserversAndNotify() 
	{
		// GIVEN:
		var test1:Int = -1;
		var test2:Int = -1;
		var test3:Int = -1;
		var observable:GenericObservable<Int> = new GenericObservable<Int>();
		observable.add("id#1", function(num) { test1 = num; });
		observable.add("id#2", function(num) { test2 = num; });
		observable.add("id#3", function(num) { test3 = num; });
		
		// WHEN:
		observable.notify(99);
		
		// THEN:
		assertEquals(99, test1);
		assertEquals(99, test2);
		assertEquals(99, test3);
	}
	
	public function testDeleteObserverById() 
	{
		// GIVEN:
		var test1:Int = -1;
		var test2:Int = -1;
		var test3:Int = -1;
		var test4:Int = -1;
		var observable:GenericObservable<Int> = new GenericObservable<Int>();
		
		observable.add("id#1", function(num) { test1 = num; });
		observable.add("id#2", function(num) { test2 = num; });
		observable.add("id#3", function(num) { test3 = num; });
		observable.add("id#4", function(num) { test4 = num; });
		
		observable.remove("id#2");
		observable.remove("id#3");
		
		// WHEN:
		observable.notify(99);
		
		// THEN:
		assertEquals(99, test1);
		assertEquals(-1, test2);
		assertEquals(-1, test3);
		assertEquals(99, test4);
	}
	
	public function testRemoveAllObserversAndNotify() 
	{
		// GIVEN:
		var test1:Int = -1;
		var test2:Int = -1;
		var test3:Int = -1;
		var observable:GenericObservable<Int> = new GenericObservable<Int>();
		
		observable.add("id#1", function(num) { test1 = num; });
		observable.add("id#2", function(num) { test2 = num; });
		observable.add("id#3", function(num) { test3 = num; });
		
		observable.removeAll();
		
		// WHEN:
		observable.notify(99);
		
		// THEN:
		assertEquals(-1, test1);
		assertEquals(-1, test2);
		assertEquals(-1, test3);
	}
}