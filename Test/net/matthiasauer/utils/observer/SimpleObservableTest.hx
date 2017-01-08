package net.matthiasauer.utils.observer;
import haxe.unit.TestCase;

/**
 * ...
 * @author Matthias Auer
 */
class SimpleObservableTest extends TestCase
{
	public function testAddObserverDoesntCallTheObserver()
	{
		// GIVEN:
		var id:String = "id#1";
		var observable:SimpleObservable = new SimpleObservable();
		var notified:Bool = false;
		
		// WHEN:
		observable.add(id, function() { notified = true; });
		
		// THEN:
		assertFalse(notified);
	}
	
	public function testNotifyWorks()
	{
		// GIVEN:
		var id:String = "id#1";
		var observable:SimpleObservable = new SimpleObservable();
		var notified:Bool = false;
		observable.add(id, function() { notified = true; });
		
		// WHEN:
		observable.notify();
		
		// THEN:
		assertTrue(notified);
	}
	
	public function testAddMultipleObserversAndNotify() 
	{
		// GIVEN:
		var test1:Bool = false;
		var test2:Bool = false;
		var test3:Bool = false;
		var observable:SimpleObservable = new SimpleObservable();
		
		observable.add("id#1", function() { test1 = true; });
		observable.add("id#2", function() { test2 = true; });
		observable.add("id#3", function() { test3 = true; });
		
		// WHEN:
		observable.notify();
		
		// THEN:
		assertTrue(test1);
		assertTrue(test2);
		assertTrue(test3);
	}
	
	public function testDeleteObserverById() 
	{
		// GIVEN:
		var test1:Bool = false;
		var test2:Bool = false;
		var test3:Bool = false;
		var test4:Bool = false;
		var observable:SimpleObservable = new SimpleObservable();
		
		observable.add("id#1", function() { test1 = true; });
		observable.add("id#2", function() { test2 = true; });
		observable.add("id#3", function() { test3 = true; });
		observable.add("id#4", function() { test4 = true; });
		
		// WHEN:
		observable.remove("id#2");
		observable.remove("id#3");
		observable.notify();

		// THEN:
		assertTrue(test1);
		assertFalse(test2);
		assertFalse(test3);
		assertTrue(test4);
	}
	
	public function testRemoveAllObserversAndNotify() 
	{
		// GIVEN:
		var test1:Bool = false;
		var test2:Bool = false;
		var test3:Bool = false;
		var observable:SimpleObservable = new SimpleObservable();
		
		observable.add("id#1", function() { test1 = true; });
		observable.add("id#2", function() { test2 = true; });
		observable.add("id#3", function() { test3 = true; });
		
		// WHEN:
		observable.removeAll();
		observable.notify();
		
		// THEN:
		assertFalse(test1);
		assertFalse(test2);
		assertFalse(test3);
	}
	
}