import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_flutter/view/AppBarView.dart';

class LoginPageState extends StatefulWidget {

  const LoginPageState({Key? key}) : super(key: key);
  @override
  State<LoginPageState> createState() => _LoginPageStateState();
}

class _LoginPageStateState extends State<LoginPageState> {

  final GlobalKey<FormState> _loginKey =GlobalKey();
  late String _username;
  late String _password;

  void _login(){
    var loginForm  = _loginKey.currentState;
    if(loginForm!.validate()) {
      loginForm.save();
      print('user name = $_username --- password = $_password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarView(
        title: "登录",
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed:() {
            Get.back();
          }
        ),
      ),
      body: Form(
        key: _loginKey,
        child: Padding(padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 30.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    labelText: "请输入登录账号",
                    labelStyle: TextStyle(color: Colors.deepOrange,fontSize: 18),
                    hintText: "请输入登录账号",
                    hintMaxLines: 1,
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                    border: OutlineInputBorder()
                ),
                onSaved: (val){
                  _username = val!;
                },
                onFieldSubmitted: (val){},
                validator: (val){
                  if(val!.isEmpty) return '用户名不能为空';
                },
              ),
              const SizedBox(height: 30.0),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: "请输入用户密码",
                    labelStyle: TextStyle(color: Colors.deepOrange,fontSize: 18),
                    hintText: "请输入用户密码",
                    hintMaxLines: 1,
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                    border: OutlineInputBorder()
                ),
                onSaved: (val){
                  _password = val!;
                },
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                onFieldSubmitted: (val){},
                validator: (val){
                  if(val!.length < 3) return '密码不能小于3个字符';
                  if(val.length > 6) {
                    return '密码不能大于6个字符';
                  } else {
                    return null;
                  }
                },

              ),
              Container(
                margin: const EdgeInsets.only(top:10.0),
                child: SizedBox(
                  width:double.infinity,
                  height: 40.0,
                  child: MaterialButton(
                    onPressed: _login,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                    color: Colors.blueAccent,
                    highlightColor:Colors.grey,
                    elevation: 1.0,
                    child: const Text(
                        '登录',
                        style:TextStyle(color: Colors.white,fontSize: 20.0)
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
