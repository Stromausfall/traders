package net.matthiasauer.utils.general;

class Pair<S, T>
{
	public var key(default, null) : S;
	public var value(default, null) : T;
	
	public function new(key:S, value:T) {
		this.key = key;
		this.value = value;
	}
}