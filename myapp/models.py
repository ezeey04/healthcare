from django.db import models
from django.contrib.auth.models import User
# Create your models here.

class doctor(models.Model):
    name=models.CharField(max_length=200)
    phone=models.BigIntegerField()
    dob=models.DateField()
    email=models.CharField(max_length=200)
    gender=models.CharField(max_length=200)
    department=models.CharField(max_length=200)
    qualification=models.CharField(max_length=200)
    place=models.CharField(max_length=200)
    post=models.CharField(max_length=200)
    pin=models.BigIntegerField()
    district=models.CharField(max_length=200)
    profile_image=models.FileField(upload_to='doctor_profiles/', blank=True, null=True)
    LOGIN=models.ForeignKey(User,on_delete=models.CASCADE)

class schedule(models.Model):
    DOCTOR=models.ForeignKey(doctor,on_delete=models.CASCADE)
    date=models.DateField()
    from_time=models.TimeField()
    to_time=models.TimeField()

class user(models.Model):
    name=models.CharField(max_length=200)
    email=models.CharField(max_length=200)
    phone=models.BigIntegerField()
    place=models.CharField(max_length=200)
    district=models.CharField(max_length=200)
    pin=models.BigIntegerField()
    dob=models.DateField()
    gender=models.CharField(max_length=200)
    LOGIN=models.ForeignKey(User,on_delete=models.CASCADE)

class booking(models.Model):
    SCHEDULE=models.ForeignKey(schedule,on_delete=models.CASCADE)
    USER=models.ForeignKey(user,on_delete=models.CASCADE)
    date=models.DateField()
    status=models.CharField(max_length=200)

class prescription(models.Model):
    BOOKING=models.ForeignKey(booking,on_delete=models.CASCADE)
    date=models.DateField()
    prescription=models.CharField(max_length=200)
    findings=models.CharField(max_length=200)
    attachment=models.FileField(upload_to='prescriptions/', blank=True, null=True)

class complaint(models.Model):
    USER=models.ForeignKey(user,on_delete=models.CASCADE)
    complaint=models.CharField(max_length=200)
    date=models.DateField()
    status=models.CharField(max_length=200)

