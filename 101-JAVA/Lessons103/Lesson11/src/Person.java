public class Person {
    private String personName;
    private int personAge;

    public void setName (String name){
        if (name == null) 
           System.err.println("invalid input!");
        else
             personName=name; 
    }
    public void setAge (int age){
        if(age < 0)
            System.out.println("invalid input!");
        else
            personAge=age;
    }

    public String getName(){
        return personName;
    }

    public int getAge(){
        return personAge;
    }
}
