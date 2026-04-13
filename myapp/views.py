from urllib import request

from django.http import HttpResponse
from django.shortcuts import redirect, render
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages

from django.contrib.auth.models import User,Group

from myapp.models import booking, complaint, doctor, prescription, schedule, user

# Create your views here.

def login_get(request):
    if request.method=='POST':
        username=request.POST['username']
        password=request.POST['password']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            print("hhh")
            if user.groups.filter(name="admin").exists():
                print("jajaja")
                login(request,user)
                return redirect('/myapp/admin_home_get/')
            elif user.groups.filter(name="doctor").exists():
                print("jajaja")
                login(request,user)
                return redirect('/myapp/doctor_home_get/')
            elif user.groups.filter(name="user").exists():
                print("jajaja")
                login(request,user)
                return redirect('/myapp/user_home_get/')
        else:
            messages.warning(request,"invalid username or password")
            return redirect('/myapp/login_get/')
    return render(request,"login.html")


def logout_get(request):
    logout(request)
    return redirect('/myapp/login_get/')




def admin_adddoctor_get(request):
    if request.method == 'POST':
        name=request.POST['name']
        phone=request.POST['phone']
        email=request.POST['email']
        dob=request.POST['dob']
        gender=request.POST['gender']
        department=request.POST['department']
        qualification=request.POST['qualification']
        place=request.POST['place']
        post=request.POST['post']
        pin=request.POST['pincode']
        district=request.POST['district']
        username=request.POST['username']
        password=request.POST['password']

        lg=User.objects.create_user(username=username,password=password)
        lg.groups.add(Group.objects.get(name="doctor"))  
        lg.save()  

        ob=doctor()
        ob.name=name
        ob.phone=phone
        ob.dob=dob
        ob.email=email
        ob.gender=gender
        ob.department=department
        ob.qualification=qualification
        ob.place=place
        ob.post=post
        ob.pin=pin
        ob.district=district
        ob.LOGIN=lg
        ob.save()
        return redirect('/myapp/admin_viewdoctor_get/')
    return render(request,"admin/adddoctor.html")

def admin_addschedule_get(request):
    data=doctor.objects.all()
    if request.method == 'POST':
        date=request.POST['date']
        fromtime=request.POST['fromtime']
        totime=request.POST['totime'] 
        did=request.POST['did'] 

        ob=schedule()
        ob.DOCTOR_id=did
        ob.date=date
        ob.from_time=fromtime
        ob.to_time=totime
        ob.save()

        return redirect('/myapp/admin_viewschedule_get/')

    return render(request,"admin/addschedule.html",{"data":data})

def admin_home_get(request):
    return render(request,"admin/admin.html")

def admin_editdoctor_get(request,id):
    ob=doctor.objects.get(id=id)

    if request.method == 'POST':
        name=request.POST['name']
        phone=request.POST['phone']
        email=request.POST['email']
        dob=request.POST['dob']
        gender=request.POST['gender']
        department=request.POST['department']
        qualification=request.POST['qualification']
        place=request.POST['place']
        post=request.POST['post']
        pincode=request.POST['pincode']
        district=request.POST['district']  
         
        ob.name=name
        ob.phone=phone
        ob.dob=dob
        ob.email=email
        ob.gender=gender
        ob.department=department
        ob.qualification=qualification
        ob.place=place
        ob.post=post
        ob.pin=pincode
        ob.district=district
        ob.save()

        return redirect('/myapp/admin_viewdoctor_get//')

    return render(request,"admin/editdoctor.html",{'data':ob})

def admin_editschedule_get(request):
    ob=doctor.objects.get(id=id)

    if request.method == 'POST':
        date=request.POST['date']
        fromtime=request.POST['fromtime']
        totime=request.POST['totime']

        ob.date=date
        ob.fromtime=fromtime
        ob.totime=totime
        ob.save()

        return redirect('/myapp/admin_viewschedule_get//')

    return render(request,"admin/editschedule.html",{'data':ob})

def admin_sendreply_get(request):
    ob=doctor.objects.get(id=id)
    if request.method == 'POST':
        reply=request.POST['reply']

        ob.reply=reply
        ob.save()

        return redirect('/myapp/admin_viewcomplaint_get//')

    return render(request,"admin/sendreply.html",{'data':ob})

def admin_verifybooking_get(request):
    data=booking.objects.all()
    return render(request,"admin/verifybooking.html",{'data':data})

def admin_viewcomplaint_get(request):
    data=complaint.objects.all()
    return render(request,"admin/viewcomplaint.html",{'data':data})

def admin_viewdoctor_get(request):
    data=doctor.objects.all()
    return render(request,"admin/viewdoctor.html",{'data':data})

def admin_viewschedule_get(request):
    data=schedule.objects.all()
    return render(request,"admin/viewschedule.html",{'data':data})



# ============================= doctor =================

def doctor_addprescription_get(request):
    ob=doctor.objects.get(id=id)
    
    if request.method == 'POST':
        priscription=request.POST['priscription']
        findings=request.POST['findings']

        ob.priscription=priscription
        ob.findings=findings
        ob.save()
        
        return redirect('/myapp/doctor_viewprescription_get//')
    return render(request,"doctor/addprescription.html")

def doctor_home_get(request):
    return render(request,"doctor/doctor.html")

def doctor_viewbooking_get(request):
    data=booking.objects.filter(SCHEDULE__DOCTOR__LOGIN_id=request.user.id)
    return render(request,"doctor/viewbooking.html",{'data':data})

def doctor_viewprescription_get(request):
    data=prescription.objects.filter()
    return render(request,"doctor/addviewpriscription.html",{'data':data})

def doctor_viewschedule_get(request):
    data=schedule.objects.filter()
    return render(request,"doctor/viewschedule.html",{'data':data})


# ================ user ===============================================================================================

def user_home_get(request):
    return render(request,"user/user.html")

def user_userregister_get(request):

    if request.method == 'POST':
        name=request.POST['name']
        phone=request.POST['phone']
        gender=request.POST['gender']
        dob=request.POST['dob']
        place=request.POST['place']
        pin=request.POST['pin']
        district=request.POST['district']
        username=request.POST['username']
        password=request.POST['password']
        
        lg=User.objects.create_user(username=username,password=password)
        lg.groups.add(Group.objects.get(name="user"))  
        lg.save() 

        ob=user()
        ob.name=name
        ob.phone=phone
        ob.gender=gender
        ob.dob=dob
        ob.place=place
        ob.pin=pin
        ob.district=district
        ob.LOGIN=lg
        ob.save()
        
        return redirect('/myapp/login_get/')
    return render(request,"user/userregister.html")

def user_viewbookingsstatus_get(request):
    data=booking.objects.filter()
    return render(request,"user/viewbookingsstatus.html",{'data':data})

def user_viewdoctor_get(request):
    data=doctor.objects.filter()
    return render(request,"user/viewdoctor.html",{'data':data})

def user_viewpriscription_get(request):
    data=prescription.objects.filter()
    return render(request,"user/viewpriscription.html",{'data':data})

def user_viewschedule_get(request):
    data=schedule.objects.filter()
    return render(request,"user/viewschedule.html",{'data':data})