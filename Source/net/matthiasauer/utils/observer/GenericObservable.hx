package net.matthiasauer.utils.observer;

class GenericObservable<T> implements IGenericObservable<T>
{
	private var observers:Map<String, T->Void> = null;
	
	public function new() 
	{
		this.removeAll();
	}
	
	public function add(key:String, observer:T->Void)
	{
		this.observers.set(key, observer);
	}
	
	public function remove(key:String)
	{
		this.observers.remove(key);
	}
	
	public function removeAll()
	{
		this.observers = new Map<String, T->Void>();
	}
	
	public function notify(message:T)
	{
		for (observer in this.observers)
		{
			observer(message);
		}
	}
}
