package bean;

public class User {
    private int id;//用户id  自增
    private String userName;//用户名
    private  String userPassword;//用户密码
    private  String userMsg;//用户提示信息
    private  String gender;//性别
    private int age;//年龄
    private String gxqm;//个性签名
    private String zy;//专业
    private int nj;//届
    private  String email;//邮箱
    private int state;//状态
    public User() {
    }

    public User(int id, String userName, String userPassword, String userMsg, String gender, int age, String gxqm, String zy, int nj, String email, int state) {
        this.id = id;
        this.userName = userName;
        this.userPassword = userPassword;
        this.userMsg = userMsg;
        this.gender = gender;
        this.age = age;
        this.gxqm = gxqm;
        this.zy = zy;
        this.nj = nj;
        this.email = email;
        this.state = state;
    }

    public User(int id, String userName, String userPassword) {

        this.userName = userName;
        this.userPassword = userPassword;
    }

    public User(String userName, String userPassword) {
        this.userName = userName;
        this.userPassword = userPassword;
    }

    public User(int id, String userName, String userPassword, String gender, int age, String email) {
        this.id = id;
        this.userName = userName;
        this.userPassword = userPassword;
        this.gender = gender;
        this.age = age;
        this.email = email;
    }

    public User(int id, String userName, String gender, int age, String email) {
        this.id = id;
        this.userName = userName;
        this.gender = gender;
        this.age = age;
        this.email = email;
    }

    public User(String userName) {
        this.userName = userName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserMsg() {
        return userMsg;
    }

    public void setUserMsg(String userMsg) {
        this.userMsg = userMsg;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGxqml() {
        return gxqm;
    }

    public void setGxqml(String gxqml) {
        this.gxqm = gxqml;
    }

    public String getZy() {
        return zy;
    }

    public void setZy(String zy) {
        this.zy = zy;
    }

    public int getNj() {
        return nj;
    }

    public void setNj(int nj) {
        this.nj = nj;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "User{" +
                "userName='" + userName + '\'' +
                ", userPassword='" + userPassword + '\'' +
                '}';
    }
}
