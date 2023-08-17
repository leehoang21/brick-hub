import 'package:flutter_eglife_ecommerce_admin/common/configs/dio_config.dart';

import '../../../../../../common/entity/base_response.dart';

class ApiService {
  final DioConfig dioConfig;
  ApiService(this.dioConfig);
  //auth
  Future<BaseResponse> login(Map<String, dynamic> params) =>
      dioConfig.post('/admin/auth/login', params);
  //product
  Future<BaseResponse> getProduct(Map<String, dynamic> params) =>
      dioConfig.get('/admin/product', params);
  Future<BaseResponse> detailProduct(String slug) =>
      dioConfig.get('/admin/product/$slug', {});
  Future<BaseResponse> addProduct(Map<String, dynamic> params) =>
      dioConfig.post('/admin/product', params);

  Future<BaseResponse> updateProduct(Map<String, dynamic> params, int id) =>
      dioConfig.patch('/admin/product/$id', params);

  Future<BaseResponse> deleteProduct(int id) =>
      dioConfig.delete('/admin/product/$id');

  //images
  Future<BaseResponse> deleteImage(int id) =>
      dioConfig.delete('/admin/image/$id');

  Future<BaseResponse> uploadImage(Map<String, dynamic> params) =>
      dioConfig.uploadImage('/admin/image', params);
  //category
  Future<BaseResponse> getCategory(Map<String, dynamic> params) =>
      dioConfig.get('/admin/category', params);
  Future<BaseResponse> detailCategory(int id) =>
      dioConfig.get('/admin/category/$id', {});
  Future<BaseResponse> addCategory(Map<String, dynamic> params) =>
      dioConfig.post('/admin/category', params);
  Future<BaseResponse> updateCategory(Map<String, dynamic> params, int id) =>
      dioConfig.patch('/admin/category/$id', params);

  Future<BaseResponse> deleteCategory(int id) =>
      dioConfig.delete('/admin/category/$id');
  //post
  Future<BaseResponse> getPost(Map<String, dynamic> params) =>
      dioConfig.get('/admin/post', params);
  Future<BaseResponse> addPost(Map<String, dynamic> params) =>
      dioConfig.post('/admin/post', params);
  Future<BaseResponse> updatePost(Map<String, dynamic> params, int id) =>
      dioConfig.patch('/admin/post/$id', params);
  Future<BaseResponse> deletePost(int id) =>
      dioConfig.delete('/admin/post/$id');
  Future<BaseResponse> detailPost(String slug) =>
      dioConfig.get('/admin/post/$slug', {});
  //user
  Future<BaseResponse> getUser(Map<String, dynamic> params) =>
      dioConfig.get('/admin/user', params);

  Future<BaseResponse> addUser(Map<String, dynamic> params) =>
      dioConfig.post('/admin/user', params);
  Future<BaseResponse> deleteUser(int id) =>
      dioConfig.delete('/admin/user/$id');
  Future<BaseResponse> detailUser(int id) =>
      dioConfig.get('/admin/user/$id', {});
  //tag
  Future<BaseResponse> getTag(Map<String, dynamic> params) =>
      dioConfig.get('/admin/tag', params);
  Future<BaseResponse> addTag(Map<String, dynamic> params) =>
      dioConfig.post('/admin/tag', params);
  Future<BaseResponse> updateTag(Map<String, dynamic> params, int id) =>
      dioConfig.patch('/admin/tag/$id', params);
  Future<BaseResponse> deleteTag(int id) => dioConfig.delete('/admin/tag/$id');
  Future<BaseResponse> detailTag(int id) => dioConfig.get('/admin/tag/$id', {});
  //advisory
  Future<BaseResponse> getAdvisory(Map<String, dynamic> params) =>
      dioConfig.get('/admin/advisory', params);
  Future<BaseResponse> addAdvisory(Map<String, dynamic> params) =>
      dioConfig.post('/admin/advisory', params);
  Future<BaseResponse> updateAdvisory(Map<String, dynamic> params, int id) =>
      dioConfig.patch('/admin/advisory/$id', params);
  Future<BaseResponse> detailAdvisory(int id) =>
      dioConfig.get('/admin/advisory/$id', {});
  //setting
  Future<BaseResponse> getSetting(Map<String, dynamic> params) =>
      dioConfig.get('/admin/setting', params);
  Future<BaseResponse> saveSetting(Map<String, dynamic> params) =>
      dioConfig.post('/admin/setting', params);
  Future<BaseResponse> deleteSetting(int id) =>
      dioConfig.delete('/admin/setting/$id');
  //order
  Future<BaseResponse> getOrder(Map<String, dynamic> params) =>
      dioConfig.get('/admin/order', params);
  Future<BaseResponse> detailOrder(int id) =>
      dioConfig.get('/admin/order/$id', {});
  Future<BaseResponse> updateOrder(Map<String, dynamic> params, int id) =>
      dioConfig.patch('/admin/order/$id', params);
  Future<BaseResponse> deleteOrder(int id) =>
      dioConfig.delete('/admin/order/$id');

  //dashboard
  Future<BaseResponse> revenue(Map<String, dynamic> params) =>
      dioConfig.get('/admin/revenue', params);
  Future<BaseResponse> hotProducts(Map<String, dynamic> params) =>
      dioConfig.get('/admin/hot_products', params);
}
