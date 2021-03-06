class CreateOptionService
    def call(question:, option_name:)
        question.options.create([
            {name: create_random_string},
            {name: create_random_string},
            {name: create_random_string}
        ])
        correct_option = question.options.create({name: option_name})
        question.update_attributes(correct_option_id: correct_option.id)
    end

    private
    def create_random_string
        (0...12).map { (('a'..'z').to_a+('A'..'Z').to_a)[rand(52)] }.join
    end

    def correct_options
        [
            "false and nil",
            "True.",
            "Sometimes.",
            "BasicObject",
            "No. Methods are not objects. Blocks are not objects.",
            "Object",
            "It is a constant.",
            "A Domain Specific Language is an API that allows you to solve a problem or represent data more naturally than you could otherwise. The flexible nature of Ruby's syntax and the ability to alias and alter existing methods and classes makes it conducive to creating DSL's.",
            "That an object may be acted upon even if it isn't the expected type as long as it looks and behaves like the expected object. This is a characteristic of Ruby because the lack of type checking of parameters makes this an effective programming technique.",
            "Dynamically typed since type checking is done at runtime.",
            "Strongly typed since an object's type is checked before an operation is performed on it.",
            "To coerce the object into an expected type. You might do this in order to try and force an unknown object type into the expected type or format required by the operation.",
            "All statements are expressions in Ruby since all statements return a value. A statement is simply a way to refer to a certain type of syntax.",
            "SecureRandom",
            "At module, class, and def.",
            "Yes.",
            "'o'",
            "Removes a line terminator.",
            "Removes the trailing character or line terminator.",
            "A new object is created for every string literal even when the values are identical.",
            "No.",
            "#each_char",
            "There is no difference in Ruby 1.9+.",
            "Symbols are scalar value objects used as identifiers, mapping immutable strings to fixed internal values.",
            "Strings are mutable while symbols are immutable. Though Ruby internally makes an immutable copy of a string when used as a hash key, comparing two symbols is faster than comparing two String objects. This is also a convention.",
            "Define singleton methods on them.",
            "The colon is an initializer of the class Symbol.",
            "False",
            "No.",
            "Fixnum",
            "It is automatically converteed to a Bignum.",
            "Integer",
            "Numeric",
            "BigDecimal",
            "#uniq",
            "It is a shortcut for array of strings",
            "With %W it's possible to do string interpolation.",
            "True",
            "False",
            "#has_key?, #include?, #member?",
            "Pass the default values as an argument to #new on initialization or change the default directly with the setter method Hash#default. You may also provide a default at time of query using #fetch.",
            "#eql?",
            "The order in which they were inserted.",
            "Hash#[]=",
            "Because Ruby makes a private copy of a string used as a hash key.",
            "It provides options for handling the case where a key does not exist in the hash.",
            "After you mutate a mutable hash key.",
            "comparison, iteration",
            "i",
            "#~=",
            "Using #{} just like as in a double-quoted string literal.",
            "$LAST_MATCH_INFO equivalent to $~",
            "It creates a Regexp object, but you don't have to escape /",
            "Explode/expand the elements of an array. Collect arguments of a parameter list into an array.",
            "The conditional operator ?: (sometimes referred to as the ternary if operator).",
            "<=>",
            "#== performs the generic comparison and is implemented differently across classes while #equal? is defined on BasicObject and compares object identity. Therefore, #equal? should not be overridden in subclasses.",
            "#== performs the generic comparison while #=== performs case equality comparison and is useful for providing meaningful semantics in case statements.",
            "#eql? is sometimes an alternate equality. Hash uses #eql? to test for hash key equality. Numeric types perform type conversion across #== but not across #eql?, thus #eql? performs a stricter comparison than #== in that case.",
            "&&",
            "&&",
            "=",
            "&&",
            "The number of values the operator performs on.",
            "A condition after a statement such as with x = 1 if a == true",
            "No.",
            "No.",
            "throw and catch accept matching symbols as arguments and should be considered a control-flow structure where raise and rescue is used to raise and handle exceptions. throw and catch are not commonly used while exception handling with raise and rescue is used often - a rescue clause is a fundamental part of the Ruby language.",
            "No.",
            "It shows intent. It DRY's out the condition.",
            "The statement is typically resistant to modification without a complete refactoring of the entire control structure. The case statement can be confusing if multiple comma-separated expressions are associated with a single when clause.",
            "#each, #map, #select, #find, #inject...",
            "Array, Hash, Set, Range, IO...",
            "The do/end syntax for a block is commonly used for multiline statements. An alternate convention is to use curly bracket syntax for blocks that return a value while using do/end syntax for blocks that change the state of the system somehow and do not return a value.",
            "An object that allows traversal of the elements of the container. In Ruby, an iterator is any method that uses the yield statement.",
            "Variables that appear after a semicolon in a block's parameter list are guaranteed to be local to the block.",
            "#member?",
            "Yes.",
            "No. A block is a syntactic structure of the interpreter. However, a block can be converted to a Proc object.",
            "#map",
            "#detect",
            "#find_all",
            "#reject",
            "#reduce",
            "It's the 'Ruby way' - it is an example of how Ruby defines methods that mimic natural language concepts. Iterator methods such as #each read more naturally. #each is a block so it defines a new variable scope. for/in depends on the existence of #each which implies that #each is a more fundamental part of the language.",
            "Nothing. Only the first argument will be passed to the block.",
            "It doesn't have a name. It doesn't exist beyond it's execution unless converted to a Proc object.",
            "Ruby will throw an exception if more than the expected number of arguments are passed to a method. A block will simply ignore the extra values in Ruby 1.9+.",
            "No.",
            "#respond_to? or #method?",
            "The current object.",
            "That it should be used cautiously. Methods with this naming convention typically perform a mutation on the receiver object.",
            "A method which alters the internal state of the object receiver.",
            "No, however, a MethodObject is an object.",
            "A method that answers a question posed by the method invocation or method name. Predicates typically return a boolean.",
            "They are public by default. You can change their visibility using Module#private, Module#protected, or back again using Module#public.",
            "To return from a method prematurely or to return multiple values.",
            "To create a synonym for the method that is more readable or appropriate for the context of some problems. To add functionality to a method.",
            "#send",
            "#freeze",
            "It must be referenced in a functional manner without an explicit receiver object and not on the class object itself or on the current object self.",
            "Yes, but the convention is that they are not.",
            "A private method can only be called by any instance methods of the defining class or any subclasses and must be invoked in a functional style and not explicitly on self such as with self.my_method. A protected method may be explicitly invoked by any instance of the defining class, and is not restricted to implicit invocation on self.",
            "A method that is available only on a single object.",
            "The runtime lookup of the appropriate definition of a method.",
            "return within a method returns from the method. return within a block returns from its lexically enclosing method.",
            "They are public by default. You can change their visibility using #private_class_method and back again using #public_class_method.",
            "Yes, it returns nil.",
            "In the case of nested method invocation such as f(g()).",
            "As a private instance method of Object, whose value of self resolves to the special 'main' object.",
            "They are instance methods of the Module class. Since Class subclasses Module, the methods can be invoked without explicit reference to self such as self.private.",
            "Check eigenclass for singleton methods including inheritance of eigenclasses on class objects, Check for instance methods, Check for instance methods of any included modules, Check instance methods and instance methods of any included modules in the inheritance hierarchy.",
            "Define the class method and then call #private_class_method with an argument as a symbol of the class method name.",
            "undef method_name, #remove_method, #undef_method",
            "#undef_method prevents any invocation of the method through an instance of the class, while #remove_method will remove the method definition from the class, but not prevent inherited methods of the same name from being invoked.",
            "You can leave off the curly brackets from a hash in a parameter list, assuming it is the only argument in the list.",
            "Procs and lambdas.",
            "Prefix & to the last parameter.",
            "It will refer to the calling block as a named Proc object. It must be the last argument in the parameter list.",
            "Calling a lambda is more akin to invoking a method where a return statement in a lambda will return from the lambda itself, instead of returning from the lexically enclosing method, as procs do. Adding to this notion, lambdas must be invoked with the exact number of arguments as is required by method invocation, whereas procs are more flexible in receiving arguments.",
            "No, & can appear before any object with a #to_proc method.",
            "There must be a block associated with lambda invocation. Lambdas must be invoked with the exact number of arguments as is required by method invocation, whereas procs are more flexible in receiving arguments.",
            "You would encounter this exception when attempting to return from a method that has already returned such as if you attempt to return from a Proc object whose lexically enclosing method has already returned.",
            "A closure is an object that is both an invocable function together with a variable binding. The object retains access to the local variables that were in scope at the time of the object definition.",
            "By reference; the closure also extends the lifetimes of its variables.",
            "The values of the variables are looked up when the Proc object is executed.",
            "Yes, you can access and alter the binding of a closure with #binding.",
            "Bind it to a receiver object using #bind.",
            "No.",
            "Using Object#method",
            "Using Module#instance_method",
            "Public.",
            "It defines it successfully since constants are publicly accessible and assignable.",
            "It does not exist.",
            "CONSTANT, and B is a subclass of A, what does a reference to CONSTANT (without a scope resolution operator) resolve to within the lexical scope of B?",
            "B::CONSTANT since B has inherited A::CONSTANT.",
            "A constant cannot be assigned within the body of a method. Dynamic constant assignment is not allowed.",
            "Creates getter and setter methods for all the symbols naming attributes it is passed as arguments.",
            "A class variable is always evaluated in reference to the class object created by the enclosing class definition while an instance variables is always evaluated in reference to self. Instance variables cannot be used outside of instance methods.",
            "Because the class keyword creates a new constant that refers to the class and constants must begin with a capital letter.",
            "An instance method.",
            "Because it would be an instance method.",
            "Class instance variables are instance variables of a class. Class instance variables cannot be used within instance methods.",
            "A class with only one instance.",
            "A singleton is a class with only one instance while a singleton method is a method that is available only on a single object.",
            "By including the Singleton module.",
            "Yes, if they are defined as singleton methods of the class.",
            "Yes.",
            "Private by default.",
            "Creates an uninitialized instance of a class.",
            "An anonymous class associated with an object. An object's singleton methods are instance methods of its associated eigenclass.",
            "Class methods are singleton methods of the eigenclass associated with the class object.",
            "A class method of the Class object that creates new classes.",
            "No. Nesting one class within another does not give the inner class any special access to the methods or variables of the outer class.",
            "The eigenclasses of an object are inherited from the eigenclasses of the superclass of the class object. An eigenclass of an object instance stands alone and does not inherit from any other classes.",
            "It is ignored.",
            "An initialization method that creates specialized instances of a class.",
            "#initialize_copy",
            "The original object that is being copied.",
            "No.",
            "The instance variables of the copy are copied by reference rather than by value.",
            "#clone copies the frozen state of an object and any singleton methods of an object while #dup does neither.",
            "Since there is only one instance of the class, there will only be one variation of the instance so any values it contains may be set explicitly from within the class definition (such as in the #initialize method itself).",
            "As mixins or as namespaces.",
            "No.",
            "The instance methods of the module become instance methods of the class.",
            "The instance methods of the module become singleton methods on the object.",
            "Module",
            "Because the module keyword creates a new constant that refers to the module and constants must begin with a capital letter.",
            "Using #is_a? such as with my_obj.is_a? MyModule.",
            "To DRY up the code. If the name of the module were to change then you would not have to change all the references to that module name. The object referenced by self would not change.",
            "Private, because it can't be used outside of a Module or Class definition.",
            "Makes class copies of the specified methods and makes instance methods private.",
            "A core Ruby class that generates other classes containing accessor methods for the specified fields.",
            "Yes.",
            "#instance_of? ignores inheritance and any mixed-in modules.",
            "All the arguments that were passed to the subclass method will be passed to the superclass method.",
            "No, since they are not defined by a class and thus are unrelated to the inheritance mechanism.",
            "Yes.",
            "Yes.",
            "No. The behavior is different than inheritance. Any alteration of a class variable by a subclass affects that class variable in the superclass and all other subclasses of the superclass.",
            "Their values can be changed at any point in the inheritance chain which could cause unexpected behavior in parent classes or subclasses which use those class variables.",
            "Overriding private methods or overwriting class variables.",
            "Override the method on the subclass or undef the method in the subclass.",
            "#attr_reader, #attr_accessor, #define_method, #method_missing, #const_missing, #eval, #class_eval, #instance_eval...",
            "Yes, since it creates getter methods at the time of the enclosing class definition.",
            "With an accessor method or using #instance_variables_get, #instance_eval, or binding.eval.",
            "#method_missing",
            "class << self",
            "Because it could be malicious.",
            "A representation of an object's variable bindings at some moment.",
            "A collection of methods mostly defined by Kernel, Object, and Module that allow a program to examine its own state and structure.",
            "#const_missing",
            "A symbol as the method name and either a block or a Method object as the method body.",
            "No, #eval can only accept a string. #class_eval and #instance_eval accept blocks.",
            "eigenclass = class << self; self; end",
            "Using #class_eval",
            "Because it doesn't alter the local scope.",
            "#instance_exec can only accept a block, and not a string, and it can accept arguments and pass them to the block, allowing the block to be evaluated in the context of the receiver object with parameters whose values come from the block.",
            "Module",
            "Object",
            "Kernel",
            "#require",
            "A global array of strings of the directories to be searched when loading files with the load and require methods. $LOAD_PATH is equivalent to $:.",
            "#require can load binary extensions. #require does not require a filename extension. #require prevents multiple loads of the same file path. #load loads the specified file at the current $SAFE level while #require loads the specified file with a $SAFE level of 0.",
            "No.",
            "#require_relative ignores the load path.",
            "Allows lazy-loading of files when a constant assigned to a file is first referenced.",
            "Converts a relative path to a fully qualified path.",
            "#entries or #foreach",
            "An IO object is an instance of class IO that can be used for reading or writing binary data to and from a file.",
            "Yes.",
            "The Gem with the highest version number.",
            "Using Kernel#gem.",
            "They will also be tainted.",
            "0",
            "You cannot lower the $SAFE level. It can only be raised.",
            "Taint is derived from the environment such as the command line, environment variables, files, sockets, etc..., while trust is derived from the $SAFE level of the originating code. Untrusted objects are both untrusted and tainted.",
            "ArgumentError",
            "NoMethodError",
            "Exception",
            "Just raises a NoMethodError.",
            "Ruby issues a warning.",
            "#inspect is the same as #to_s, except for that some classes redefine #inspect to provide output that is more helpful in debugging.",
            "#p converts objects to strings with the #inspect method instead of with #to_s.",
            "-d or --debug",
            "$ERROR_INFO equivalent to $!",
            "Using Exception.backtrace or Kernel#caller",
            "The name as a symbol of the currently executing method.",
            "Kernel#__callee__",
            "Matz's Ruby Interpreter",
            "Interactive Ruby",
            "#puts appends a newline to the output.",
            "It does not exist within the object model. It exists as a function of the interpreter.",
            "ASCII",
            "ENV",
            "It is a syntactical conversion of the interpreter.",
            "ARGV",
            "-w",
            "Symbols.",
            "English"
        ]
    end
end