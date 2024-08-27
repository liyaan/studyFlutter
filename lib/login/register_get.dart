import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_flutter/view/AppBarView.dart';

import '../controller/RegisterController.dart';

class RegisterPageGetState extends GetView<RegisterController> {
  const RegisterPageGetState({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBarView(
        title: "注册",
        leading: IconButton(
            icon:const Icon(Icons.arrow_back_ios),
            onPressed:() {
              controller.back();
            }
        ),
      ),
      body: Form(
          key: controller.loginKey,
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
                    controller.username = val!;
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
                    controller.password = val!;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  onFieldSubmitted: (val){},
                  validator: (val){
                    if(val!.length < 6) return '密码不能小于6个字符';
                    if(val.length > 18) {
                      return '密码不能大于18个字符';
                    } else {
                      return null;
                    }
                  },

                ),
                const SizedBox(height: 30.0),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "请输入用户确认密码",
                      labelStyle: TextStyle(color: Colors.deepOrange,fontSize: 18),
                      hintText: "请输入用户确认密码",
                      hintMaxLines: 1,
                      hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                      border: OutlineInputBorder()
                  ),
                  onSaved: (val){
                    controller.repassword = val!;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  onFieldSubmitted: (val){},
                  validator: (val){
                    if(val!.length < 6) return '密码不能小于6个字符';
                    if(val.length > 18) {
                      return '密码不能大于18个字符';
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
                    child: ElevatedButton(
                      onPressed:(){
                        controller.regiter();
                      },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white,
                          disabledForegroundColor:Colors.grey,
                          disabledBackgroundColor: Colors.grey,
                          textStyle: const TextStyle(fontSize: 16),
                          elevation: 1.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                          )
                        ),

                      child: const Text(
                          '注册',
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
