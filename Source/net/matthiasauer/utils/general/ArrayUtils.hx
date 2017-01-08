package net.matthiasauer.utils.general;

/**
 * ...
 * @author 
 */
class ArrayUtils 
{
	public static function transform<T, S>(toTransform:Array<S>, transformFun:S->T) : Array<T> {
		var result:Array<T> = new Array<T>();

		for (element in toTransform) {
			var transformed:T = transformFun(element);
			result.push(transformed);
		}
		
		return result;
	}
}