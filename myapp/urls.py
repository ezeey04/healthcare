
from django.contrib import admin
from django.urls import path

from . import views

urlpatterns = [
    path('login_get/', views.login_get),
    path('logout_get/',views.logout_get),
    path('delete_doctor_get/<id>',views.delete_doctor_get),
    path('delete_schedule_get/<id>',views.delete_schedule_get),
    path('delete_prescription_get/<id>',views.delete_prescription_get),
    
#========================= admin=======================================
    path('admin_adddoctor_get/',views.admin_adddoctor_get),
    path('admin_addschedule_get/',views.admin_addschedule_get),
    path('admin_home_get/',views.admin_home_get),
    path('admin_editdoctor_get/<id>',views.admin_editdoctor_get),
    path('admin_editschedule_get/<id>',views.admin_editschedule_get),
    path('admin_sendreply_get/',views.admin_sendreply_get),
    path('admin_verifybooking_get/',views.admin_verifybooking_get),
    path('admin_viewdoctor_get/',views.admin_viewdoctor_get),
    path('admin_viewschedule_get/',views.admin_viewschedule_get),
    path('admin_accept_booking_get/<id>',views.admin_accept_booking_get),
    path('admin_reject_booking_get/<id>',views.admin_reject_booking_get),
#========================= doctor=======================================
    path('doctor_addprescription_get/<id>/',views.doctor_addprescription_get),
    path('doctor_addprescription_POST/',views.doctor_addprescription_POST),
    path('doctor_home_get/',views.doctor_home_get),
    path('doctor_viewbooking_get/<id>/',views.doctor_viewbooking_get),
    path('doctor_viewprescription_get/<id>',views.doctor_viewprescription_get),
    path('doctor_viewschedule_get/',views.doctor_viewschedule_get),
    path('doctor_viewbooking_get_all/',views.doctor_viewbooking_get_all),


    #============================== user====================================
    
    path('user_home_get/',views.user_home_get),
    path('user_userregister_get/',views.user_userregister_get),
    path('user_viewbookingsstatus_get/',views.user_viewbookingsstatus_get),
    path('user_viewdoctor_get/',views.user_viewdoctor_get),
    path('user_viewprescription_get/',views.user_viewprescription_get),
    path('user_book_schedule/<id>',views.user_book_schedule),
    path('user_viewschedule_get/<id>',views.user_viewschedule_get),


]


