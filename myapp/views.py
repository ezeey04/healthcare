from datetime import datetime
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
        else:
            messages.warning(request,"invalid username or password")
            return redirect('/myapp/login_get/')
    return render(request,"login.html")


def logout_get(request):
    logout(request)
    return redirect('/myapp/login_get/')

def delete_doctor_get(request,id):
    ob=doctor.objects.get(id=id)
    a=ob.LOGIN
    a.delete()
    return redirect('/myapp/admin_viewdoctor_get/')

def delete_schedule_get(request,id):
    ob=schedule.objects.get(id=id)
    ob.delete()
    return redirect('/myapp/admin_viewschedule_get/')

# def delete_prescription_get(request,id):
#     ob=prescription.objects.get(id=id)
#     ob.delete()
#     return redirect('/myapp/doctor_viewprescription_get/')

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
        profile_image=request.FILES.get('profile_image')

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
        ob.profile_image=profile_image
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



from myapp.models import doctor, booking
from datetime import date

def admin_home_get(request):

    # Total doctors
    total_doctors = doctor.objects.count()

    # Active bookings (accepted)
    active_bookings = booking.objects.filter(status='accepted').count()

    # New bookings today
    today = date.today()
    new_bookings = booking.objects.filter(date=today).count()

    # Optional: new doctors (simple demo or replace with real logic)
    new_doctors = doctor.objects.count()  # you can customize later

    return render(request, "admin/admin.html", {
        'total_doctors': total_doctors,
        'new_doctors': new_doctors,
        'active_bookings': active_bookings,
        'new_bookings': new_bookings
    })


def admin_accept_booking_get(request,id):
    ob=booking.objects.get(id=id)
    ob.status='accepted'
    ob.save()
    return redirect('/myapp/admin_verifybooking_get/')


def admin_reject_booking_get(request,id):
    ob=booking.objects.get(id=id)
    ob.status='rejected'
    ob.save()
    return redirect('/myapp/admin_verifybooking_get/')


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
        profile_image=request.FILES.get('profile_image')
         
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
        if profile_image:
            ob.profile_image=profile_image
        ob.save()

        return redirect('/myapp/admin_viewdoctor_get/')

    return render(request,"admin/editdoctor.html",{'data':ob})

def admin_editschedule_get(request, id):
    ob = schedule.objects.get(id=id)  

    if request.method == 'POST':
        date = request.POST.get('date')
        fromtime = request.POST.get('fromtime')
        totime = request.POST.get('totime')

        ob.date = date
        ob.from_time = fromtime
        ob.to_time = totime
        ob.save()

        return redirect('/myapp/admin_viewschedule_get/')

    return render(request, "admin/editschedule.html", {'data': ob})

def admin_sendreply_get(request):
    ob=doctor.objects.get(id=id)
    if request.method == 'POST':
        reply=request.POST['reply']

        ob.reply=reply
        ob.save()

        return redirect('/myapp/admin_viewcomplaint_get/')

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

# def doctor_addprescription_get(request,id):
#     request.session['booking_id'] = id
#     return render(request,"doctor/addprescription.html")

# def doctor_addprescription_POST(request):
    # ob=doctor.objects.get(id=id)
    
    prescriptions=request.POST['prescription']
    findings=request.POST['findings']

    ob=prescription()
    ob.BOOKING_id=request.session['booking_id']

    ob.prescription=prescriptions
    ob.findings=findings
    ob.save()

    k=request.session['booking_id']
    
    return redirect(f'/myapp/doctor_viewprescription_get/{k}/')




from django.shortcuts import render, redirect
from myapp.models import prescription

# 👉 OPEN ADD FORM
def doctor_addprescription_get(request, id):
    request.session['booking_id'] = id
    ob=booking.objects.get(id=id)
    return render(request, "doctor/addprescription.html", {'booking': ob})


# 👉 SAVE PRESCRIPTION
def doctor_addprescription_POST(request):
    prescriptions = request.POST.get('prescription')
    findings = request.POST.get('findings')
    attachment = request.FILES.get('attachment')

    booking_id = request.session.get('booking_id')

    ob = prescription()
    ob.BOOKING_id = booking_id
    ob.prescription = prescriptions
    ob.findings = findings
    ob.date=datetime.today()
    ob.attachment = attachment
    ob.save()


    ob.BOOKING.status = 'completed'
    ob.BOOKING.save()
    return redirect(f'/myapp/doctor_viewbooking_get/{booking_id}/')


# 👉 VIEW PRESCRIPTION (ONLY FOR ONE BOOKING)
def doctor_viewprescription_get(request, id):
    data = prescription.objects.filter(BOOKING_id=id)
    return render(request, "doctor/viewprescription.html", {'data': data})


# 👉 DELETE PRESCRIPTION
def delete_prescription_get(request, id):
    prescription.objects.get(id=id).delete()
    booking_id = request.session.get('booking_id')

    return redirect(f'/myapp/doctor_viewprescription_get/{booking_id}')




def doctor_home_get(request):
    import datetime
    # Get current date info
    today = datetime.date.today()
    # Calculate the start (Monday) and end (Sunday) of the current week
    start_of_week = today - datetime.timedelta(days=today.weekday())
    end_of_week = start_of_week + datetime.timedelta(days=6)

    # Get the logged-in doctor
    dt = doctor.objects.get(LOGIN_id=request.user.id)

    # 1. Pending Reviews (Count of 'booked' status)
    pending_reviews = booking.objects.filter(
        SCHEDULE__DOCTOR=dt, 
        status='booked'
    ).count()

    # 2. Today's Appointments Count (Assuming we only count 'accepted' for their schedule)
    appointments_today = booking.objects.filter(
        SCHEDULE__DOCTOR=dt, 
        date=today, 
        status='accepted'
    ).count()

    # 3. This Week's Appointments Count
    this_week_appointments = booking.objects.filter(
        SCHEDULE__DOCTOR=dt, 
        date__range=[start_of_week, end_of_week], 
        status='accepted'
    ).count()

    # 4. Latest two accepted appointments (upcoming ones)
    # Using date__gte=today to only show future/current appointments, ordered by closest date/time
    latest_two_appointments = booking.objects.filter(
        SCHEDULE__DOCTOR=dt, 
        status='accepted',
        date__gte=today
    ).order_by('date', 'SCHEDULE__from_time')[:2]

    # Package context variables matching your HTML template
    context = {
        'dt': dt,
        'pending_reviews': pending_reviews,
        'appointments_today': appointments_today,
        'this_week_appointments': this_week_appointments,
        'data': latest_two_appointments,
    }

    return render(request, "doctor/doctor.html", context)

def doctor_viewbooking_get(request,id):
    data=booking.objects.filter(SCHEDULE_id=id,status='accepted')
    return render(request,"doctor/viewbooking.html",{'data':data})

def doctor_viewbooking_get_all(request):
    data=booking.objects.filter(SCHEDULE__DOCTOR__LOGIN_id=request.user.id,status='accepted')
    return render(request,"doctor/viewbooking all.html",{'data':data})

# def doctor_viewprescription_get(request,id):
#     data=prescription.objects.filter(BOOKING_id=id)
#     return render(request,"doctor/viewprescription.html",{'data':data})

def doctor_viewschedule_get(request):
    data=schedule.objects.filter(DOCTOR__LOGIN_id=request.user.id)
    return render(request,"doctor/viewschedule.html",{'data':data})


# ================ user ===============================================================================================



def user_home_get(request):
    from django.utils import timezone

    us = user.objects.get(LOGIN_id=request.user.id)
    
    today = timezone.now().date()
    
    upcoming_count = booking.objects.filter(
        USER=us, 
        status='accepted', 
        SCHEDULE__date__gte=today
    ).count()
    
    pending_count = booking.objects.filter(
        USER=us, 
        status='booked'
    ).count()
    
    prescription_count = prescription.objects.filter(
        BOOKING__USER=us
    ).count()
    

    latest_appointments = booking.objects.filter(
        USER=us, 
        status='accepted', 
        SCHEDULE__date__gte=today
    ).order_by('SCHEDULE__date', 'SCHEDULE__from_time')[:3]

    context = {
        'user': us,
        'upcoming_appointments': upcoming_count,
        'pending_bookings': pending_count,
        'prescriptions': prescription_count,
        'data': latest_appointments,
    }
    
    return render(request, "user/user.html", context)

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


def user_book_schedule(request,id):
    ob=booking()
    ob.SCHEDULE_id=id
    ob.USER=user.objects.get(LOGIN=request.user)
    ob.date=datetime.today()
    ob.status='booked'
    ob.save()

    return redirect('/myapp/user_viewbookingsstatus_get/')

def user_viewbookingsstatus_get(request):
    us = user.objects.get(LOGIN_id=request.user.id)
    data = booking.objects.filter(USER=us).select_related('SCHEDULE__DOCTOR').order_by('-date', '-id')
    context = {
        'data': data,
        'pending_count': data.filter(status='booked').count(),
        'confirmed_count': data.filter(status='accepted').count(),
        'rejected_count': data.filter(status='rejected').count(),
    }
    return render(request,"user/viewbookingsstatus.html", context)

def user_viewdoctor_get(request):
    data=doctor.objects.all()
    return render(request,"user/viewdoctor.html",{'data':data})

def user_viewprescription_get(request):
    data=prescription.objects.filter(BOOKING__USER__LOGIN__id=request.user.id)
    return render(request,"user/viewprescription.html",{'data':data})

# def user_viewschedule_get(request):
#     data=schedule.objects.filter()
#     return render(request,"user/viewschedule.html",{'data':data})



def user_viewschedule_get(request, id):
    from datetime import datetime

    data = schedule.objects.filter(DOCTOR_id=id, date__gte=datetime.today())
    doc = doctor.objects.get(id=id)
    
    booked_schedule_ids = booking.objects.filter(USER__LOGIN=request.user).values_list('SCHEDULE_id', flat=True)
    print(data)
    return render(request, "user/viewschedule.html", {
        'data': data, 
        'doctor': doc,
        'booked_schedule_ids': booked_schedule_ids 
    })
