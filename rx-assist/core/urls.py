from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name="home"),

    path('register/', views.registerView, name="reg"),
    path('reg_user/', views.registerUser, name='reg_user'),
    path('login/', views.loginView, name='login'),
    path('patient/', views.patient_home, name='patient'),
    path('diagnosis/', views.diagnosis, name='diagnosis'),
    path('diagnosis/predict/', views.MakePredict, name='predict'),
    path('result/', views.patient_result, name='result'),
    path('result/appointment/', views.MakeMent, name='appointment'),
    path('appointment/', views.patient_ment, name='ment_list'),
    path('logout/', views.logoutView, name='logout'),
    path('doctor/', views.doctor_home, name='doctor'),
    path('commend/', views.doctor_commend, name='commend'),
    path('update_medicine/', views.update, name='updates'),
    path('commend/predict/', views.MakeMend, name='mend'),
    path('chats/',views.conversation,name="chats"),
    path('chats/send/', views.send, name='send'),
    path('meet/', views.doctor_ment, name='meet_list'),
    path('meet/save/', views.SaveMent, name='savement'),
    path('about/', views.about, name='about'),
    path('doctors/', views.doctor_list, name='doctors'),
]
