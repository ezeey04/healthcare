
from django.contrib import admin
from django.urls import path

from . import views

urlpatterns = [
    path('login_get/', views.login_get),
    path('logout_get/',views.logout_get),
    path('admin_adddoctor_get/',views.admin_adddoctor_get),
    path('admin_addschedule_get/',views.admin_addschedule_get),
    path('admin_home_get/',views.admin_home_get),
    path('admin_editdoctor_get/<id>',views.admin_editdoctor_get),
    path('admin_editschedule_get/',views.admin_editschedule_get),
    path('admin_sendreply_get/',views.admin_sendreply_get),
    path('admin_verifybooking_get/',views.admin_verifybooking_get),
    path('admin_viewcomplaint_get/',views.admin_viewcomplaint_get),
    path('admin_viewdoctor_get/',views.admin_viewdoctor_get),
    path('admin_viewschedule_get/',views.admin_viewschedule_get),

#========================= doctor=======================================
    path('doctor_addprescription_get/',views.doctor_addprescription_get),
    path('doctor_home_get/',views.doctor_home_get),
    path('doctor_viewbooking/',views.doctor_viewbooking_get),
    path('doctor_viewpriscription/',views.doctor_viewprescription_get),
    path('doctor_viewschedule_get/',views.doctor_viewschedule_get),


    #============================== user====================================
    
    path('user_home_get/',views.user_home_get),
    path('user_userregister_get/',views.user_userregister_get),
    path('user_viewbookingsstatus_get/',views.user_viewbookingsstatus_get),
    path('user_viewdoctor_get/',views.user_viewdoctor_get),
    path('user_viewpriscription_get/',views.user_viewpriscription_get),
    path('user_viewschedule_get/',views.user_viewschedule_get),


]


