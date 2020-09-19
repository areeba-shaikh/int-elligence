class User {
  String name, email,password,gender,bloodGroup, mobile,age;
  User(String n,String e,String p,String g,String b,String m,String a) {
    name = n;
    email = e;
    password = p;
    gender = g;
    bloodGroup = g;
    age = a;
    mobile = m;


  }

  User.login(String e,String p) {
    
    email = e;
    password = p;
    


  }
}
