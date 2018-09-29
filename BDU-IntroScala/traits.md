A trait encapsulates method and field definitions, which can then be reused by mixing them into classes. Unlike class inheritance, in which each class must inherit from just one superclass, a class can mix in any number of traits.

Traits are used to define object types by specifying the signature of the supported methods. Scala also allows traits to be partially implemented but traits may not have constructor parameters.

A trait definition looks just like a class definition except that it uses the keyword trait. The following is the basic example syntax of trait.

Syntax
trait Equal {
   def isEqual(x: Any): Boolean
   def isNotEqual(x: Any): Boolean = !isEqual(x)
}
This trait consists of two methods isEqual and isNotEqual. Here, we have not given any implementation for isEqual where as another method has its implementation. Child classes extending a trait can give implementation for the un-implemented methods. So a trait is very similar to what we have abstract classes in Java.

Let us assume an example of trait Equal contain two methods isEqual() and isNotEqual(). The trait Equal contain one implemented method that is isEqual() so when user defined class Point extends the trait Equal, implementation to isEqual() method in Point class should be provided.

Here it is required to know two important method of Scala, which are used in the following example.

obj.isInstanceOf [Point] To check Type of obj and Point are same are not.

obj.asInstanceOf [Point] means exact casting by taking the object obj type and returns the same obj as Point type.

Try the following example program to implement traits.

Example
trait Equal {
   def isEqual(x: Any): Boolean
   def isNotEqual(x: Any): Boolean = !isEqual(x)
}

class Point(xc: Int, yc: Int) extends Equal {
   var x: Int = xc
   var y: Int = yc
   
   def isEqual(obj: Any) = obj.isInstanceOf[Point] && obj.asInstanceOf[Point].x == y
}

object Demo {
   def main(args: Array[String]) {
      val p1 = new Point(2, 3)
      val p2 = new Point(2, 4)
      val p3 = new Point(3, 3)

      println(p1.isNotEqual(p2))
      println(p1.isNotEqual(p3))
      println(p1.isNotEqual(2))
   }
}
Save the above program in Demo.scala. The following commands are used to compile and execute this program.

Command
\>scalac Demo.scala
\>scala Demo
Output
false
true
true
Value classes and Universal Traits
Value classes are new mechanism in Scala to avoid allocating runtime objects. It contains a primary constructor with exactly one val parameter. It contains only methods (def) not allowed var, val, nested classes, traits, or objects. Value class cannot be extended by another class. This can be possible by extending your value class with AnyVal. The typesafety of custom datatypes without the runtime overhead.

Let us take an examples of value classes Weight, Height, Email, Age, etc. For all these examples it is not required to allocate memory in the application.

A value class not allowed to extend traits. To permit value classes to extend traits, universal traits are introduced which extends for Any.

Example
trait Printable extends Any {
   def print(): Unit = println(this)
}
class Wrapper(val underlying: Int) extends AnyVal with Printable

object Demo {
   def main(args: Array[String]) {
      val w = new Wrapper(3)
      w.print() // actually requires instantiating a Wrapper instance
   }
}
Save the above program in Demo.scala. The following commands are used to compile and execute this program.

Command
\>scalac Demo.scala
\>scala Demo
Output
It will give you the hash code of Wrapper class.

Wrapper@13

#### When to Use Traits?
There is no firm rule, but here are few guidelines to consider −

If the behavior will not be reused, then make it a concrete class. It is not reusable behavior after all.

If it might be reused in multiple, unrelated classes, make it a trait. Only traits can be mixed into different parts of the class hierarchy.

If you want to inherit from it in Java code, use an abstract class.

If you plan to distribute it in compiled form, and you expect outside groups to write classes inheriting from it, you might lean towards using an abstract class.

If efficiency is very important, lean towards using a class.
