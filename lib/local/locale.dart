import 'package:get/get.dart';

class Mylocale implements Translations {
  Map<String, Map<String, String>> list = {'ar': {}, 'en': {}};
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': {
          //db
          'namecat': 'name_ar',
          'lang': 'ar',
          '_dateformat': 'ar_SU',
          'Accepted': 'تم القبول',
          'AM': 'صباحاً',
          'PM': 'مساءً',
          'Canceled': 'تم الغاء',
          'Pending': 'قيد الانتظار',
          'bio': 'bio_ar',
          'professional_title': 'professional_title_ar',
          'clinical_name': 'clinical_name_ar',
          'clinical_description': 'clinical_description_ar',
          'clinical_address': 'clinical_address_ar',
          'full_name': 'full_name_ar',
          'education': 'nurse_edu_ar',
          'another_services': 'another_services_ar',
          //my request page
          '_activity': 'نشاطي',
          '_visit': 'زيارة منزلية',
          '_Advices': 'النصائح اليومية',
          '_Advice': 'نصيحة',

          //profile page
          '_Welcome': 'اهلا بك في شفاء',
          "_Account": "حسابي",
          "_Favourite": "المفضلة",
          "_Language": "اللغة",
          "_Rate": "تقييم",
          "_About": "حول",
          "_Logout": "تسجيل الخروج",
          ////////Medicine/////////
          '_meddelete': 'حذف الدواء',
          '_meddone': 'تم ',
          '_medinfo': 'معلومات الدواء',
          '_medclose': 'اغلاق',
          '_addmed': 'اضافة دواء',
          '_today': 'اليوم',
          '_medalart': 'تنبيه ',
          '_medalartNote': 'تأكد من ادخال جميع البيانات',
          '_medunit': 'الوحدة',
          '_medamount': 'الكمية',
          '_medaddnew': 'اضافة جديد',
          '_medname': 'اسم الدواء',
          '_medtype': 'نوع الدواء',
          '_meddose': 'الجرعة',
          '_medstartdate': 'تاريخ البدء',
          '_medstarttime': 'وقت البدء',
          '_medinterval': ' كام مرة في اليوم',
          '_medduratoin': 'المدة',
          '_medsave': 'حفظ',
          '_confirmNote': 'هل تريد تأكيد الطلب',
          '_rejectNote': 'هل تريد رفض الطلب',
          '_reject': 'رفض',
          /////////////////////////

          //Home
          '1': 'الصفحة الرئيسية',
          '2': 'اضافة الادوية',
          '3': 'تنبيه لمواعيد ادويتك',
          '4': 'مساعده طبيه',
          '5': 'تواصل مع طبيب او ممرض',
          '6': "مقدمات السكري",
          '7': "اكتشف اذا كنت معرض للاصابة بمرض السكري ام لا",
          '_yes': "نعم",
          '_no': "لا",

          //to Do list
          '_createNote': "إدخال مهمه جديده",
          '_myNote': "مهامي",
          '_add': "إضافة",
          '_cancel': "إلغاء",
          '_update': "تعديل",
          '_toDo': "قوائم المهام",
          '_deleteNote': "حذف المهمه",
          '_updateNote': "تعديل المهمه'",
          'Registered nurse - Qualified nurse': 'أخصائي تمريض',
          'Technical nurse - Nurse': 'فني تمريض',
          'Nurse aid': 'مساعد تمريض',
          '_uploadPhotos': 'المستندات غير مُدرجه',

          //Bottom Nav
          '_home': "الرئيسيه",
          '_chats': "الرسائل",

          '_todayMessage': "رسالة اليوم",

          //Drawer

          '_userName': "اسم المستخدم",
          '_dashBoard': "DashBoard",
          '_settings': "الإعدادات",
          '_addNotes': "إضافة ملاحظات",
          '_logOut': "تسجيل الخروج",
          '_logIn': "تسجيل الدخول",
          '_reportAProblem': "إبلاغ عن مشكلة",

          //Settings
          '_editProfile': "تعديل الملف الشخصي",
          '_themeMode': "الوضع المظلم",
          '_notification': "الإشعارات",
          '_chooseLanguage': "اختر اللغة",
          '_language': "اللغة",
          '_english': "اللغة الإنجليزيه",
          '_arabic': "اللغة العربية",
          '_notificationON': "تشغيل الإشعارات",
          '_notificationOFF': "إيقاف الإشعارات",
          //sign

          '_pickFromGallery': "اختر من المعرض",
          '_pickFromCamera': "التقط صورة",
          '_alterImage': "هل تريد إزالة الصوره؟",

          '_phoneRequired': "يجب إدخال رقم الهاتف!",
          '_phoneNumber': "رقم الهاتف",
          '_selectYourCountry': "اختر الدولة التابع لها",
          '_female': "انثى",
          '_male': "ذكر",
          '_both': "كلاهما",
          '_egypt': "مصر",
          '_other': "أُخري",
          '_selectYourGovernorate': "اختر المحافظة",
          '_selectYourCity': "اختر الحي",
          '_selectFile': "اختر الملف",
          '_uploadFile': "إدراج الملف",
          '_signUp': "تسجيل مستخدم جديد  ",
          '_sign': "تسجيل  ",
          '_in': "الدخول",

          '_firstName': "ادخل الاسم الاول",
          '_lastName': "ادخل الاسم الاخير",
          '_fullName': "ادخل الاسم كاملًا بالعربي كما في بطاقة الرقم القومي",
          '_email': "ادخل البريد الالكتروني",
          '_id': "ادخل الرقم القومي",

          '_passs': "ادخل كلمة المرور الخاصة بك",
          '_phone': "ادخل رقم الهاتف",
          '_ePhone': "ادخل رقم هاتف آخر لحالات الطوارئ",
          '_birthdate': "ادخل تاريخ الميلاد",
          '_gender': "اختر النوع",
          '_continue': "اكمل",
          '_register': "سجل",
          '_registerAs': "تسجيل الدخول كـ",

          '_doctor': "طبيبـ/ـه",
          '_nurse': "ممرضـ/ـه",
          '_user': "مستخدمـ/ه",

          '_emptyField': "لا يمكن ترك الحقل فارغا",
          '_validEmail': "الرجاء ادخال بريد الكتروني صالح",
          '_shortPass': "كلمة المرور قصيرة للغايه",
          '_strongPass': "كلمة المرور جيده",
          '_greatPass': "كلمة المرور قوية",

          '_Pass': "ادخل كلمة مرور قوية",
          '_reEnterPass': "اعد إدخال كلمة المرور",

          '_minPass': "يجب ألا تقل كلمة المرور عن ثمانية أحرف",
          '_forgotPassword': "هل نسيت كلمة المرور؟",
          '_signAlso': "يمكنك تسجيل الدخول بواسطة:",

          '_noAccount': "إذا لم تكن تملك حسابًا",
          '_createOne': "قم بعمل حساب لك الآن",
          '_noUser': "لا يوجد مستخدم مسجل بهذا البريد الالكتروني",
          '_wrongPass': "كلمة المرور لهذا المستخدم خاطئة",
          '_change': "تغيير",
          '_aboutDoc': "معلومات عن الطبيب؟",

//Medical Team Uploads
          '_professionalTitle': "الدرجة العلميه",
          '_professionalTitledetails': " الدرجة العلميه بالتفصيل",
          '_competeProfile': "استكمال ملف التعريف الخاص بك",
          '_uploadPhoto': "إدراج صوره لك",
          '_mainSpecialise': "اختر تخصصك الأساسي",
          '_subSpecialise': "اختر التخصصات الفرعيه",
          '_subSpecialiseNote':
              "في حالة عدم وجود تخصصات فرعيه لك اترك الحقل فارغًا",
          '_educationalQualification': "المؤهل الدراسي",
          '_spokenLan': "اختر اللغات التي تستطيع التحدث بها",
          '_arabicProfile': "باللغة العربية",
          '_englishProfile': "باللغة الانجليزيه",
          '_arabicProfileTxt': "اكمل ادخال البيانات المطلوبة باللغة العربية",
          '_englishProfileTxt':
              "اكمل ادخال البيانات المطلوبة باللغة الانجليزيه",

          '_all': 'الكل',
          '_professor': 'استاذ',
          '_assistantProfessor': 'مساعد استاذ',
          '_lecturer': 'مدرس',
          '_assistantLecturer': 'مساعد مدرس',
          '_specialist': 'استشاري',
          '_consultant': 'اخصائي',
          'Professor': 'استاذ',
          'AssistantProfessor': 'مساعد استاذ',
          'Lecturer': 'مدرس',
          'AssistantLecturer': 'مساعد مدرس',
          'Specialist': 'استشاري',
          'Consultant': 'اخصائي',

          '_submit': 'تم',
          '_ok': 'موافق',
          '_selectTopic': 'حدد من الاختيارات',
//OnBoarding

          '_startNow': " ابدأ الآن",
          '_controlDrugs': "متابعة الدواء",
          '_controlDrugsSub':
              "سيكون التطبيق بمثابة ممرض خاص بالمريض يوفر له التنبيهات اللازمة بمواعيد الادوية كما يتيح لك متابعة ادويتك بكل سهولة",
          '_medicalTeamBoard':
              " سيكون التطبيق منصة لتسهيل التواصل بين المرضى و الممرضات والأطباء.",

//chats
          '_sendMessage': "ارسل رسالة",
          '_reportProblem': "إبلاغ",

//Doctors other data
          '_doctorName': "اسم الطبيب",
          '_doctorSpecialise': "تخصص الطبيب",
          '_error': "خطأ",
          '_sthWrong': "حاول مرة أخري لاحقًا",

//Nurse other data
          '_nurseName': "اسم الممرض",

//Dashboard
          '_doctorRequests': " طلبات الأطباء",
          '_showAllDoctors': " عرض جميع الاطباء",
          '_AllDoctors': "  جميع الأطباء",

          '_nurseRequests': " طلبات الممرضين",
          '_showAllNurses': " عرض جميع الممرضين",
          '_AllNurses': " جميع الممرضين",

          '_addTown': " إضافة مدينه جديده",
          '_dayTip': " نصيحة اليوم",
          'top_rating': "التقييم العالي",
//userhome page (ismail)
          '_ShowAllSpecialties': 'كل التخصصات',
          '_Nursing': 'طلب تمريض',
          '_doctoring': 'الاطباء',
          '_searchin': 'البحث في',
          '_allgovs': 'جميع المحافظات',
          '_search': 'ابحث في خدماتك',
          '_How': "كيف يمكننا مساعدتك ؟",
          '_popular': "الفئات الأكثر استخدامًا",
          '_Heart': "قلب وأوعية دموية",
          "Dentist": "اسنان",
          "Neurologist": "مخ واعصاب",
          "Bones": "عظام",
          "Eyes": "عيون",
          "All Categories": "كل التخصصات",
          'Aboutt': 'عن الدكتور',
          "Doctors": "الأطباء",
          'Place': "المكان",
          'Filter': "التصفيه",
          'Sort': "الترتيب",
          "Title": "لقب",
          "Gender": "النوع",
          "Vezeta": "السعر",
//EditProfile
          '_save': "حفظ",
          '_updatePhoto': "تعديل الصوره",

//Homepage_nurse (Megz)
          '_homepage': "الصفحة الرئيسية",
          '_MangeAppointments': "ادارة المواعيد",
          '_booked': 'محجوز',
          '_unbooked': 'غير محجوز',
          '_Control': "التحكم",
          '_MyProfile': "الصفحة الشخصية",
          '_Requests': " الطلبات",
          '_RequestsAccepted': "الطلبات المقبولة",
          '_AddconsulationSchedule': "اضافة جدول المواعيد",
          '_Appointments': "المواعيد",
          '_CommentsAndRating': "التقيمات",
          '_Signout': "تسجيل الخروج",

//profile_nurse
          '_Nurse': "ممرض",
          '_myprofile': "صفحتى",
          '_Home': "يعيش فى",
          '_Email': "البريد الالكترونى",
          '_Phone': "رقم الهاتف",
          '_WORKAT': "يعمل لدى",
          '_education': "المؤهل الدراسى",
          '_services': "الخدمات الطبيه",
          '_Title': "التخصص الوظيفى",
          '_birthday': "تاريخ الميلاد",
          '_category': "التخصص",
          '_Editprofile': "اعدادات الصفحة الشخصية",
          '_Updateprofile': "تعديل الصفحة",

//Detailse_nurse
          '_Details': "التفاصيل",
          '_Date': "تاريخ",
          '_Time': "الوقت",
          '_status': "الحالة",
          '_Confirm': "تاكيد",
          '_Finish': "انهاء",
          '_Delete': "حذف",
          '_Success': "تم",
          '_RequestAccepted': "تم قبول الطلب",
          '_RequestDeleted': "تم رفض الطلب",

//Comments_nurse
          '_CommentsList': "قائمة التعليقات",
          '_Comments': "التعليقات",

//Nursenavigationbar
          '_requests': "الطلبات",
          '_Chat': "محادثة",
          '_Profile': "الصفحة الشخصية",

//addapp_nurse
          '_AddAppointment': "اضافة موعد",
          '_Price': "السعر",
          '_EnterPrice': "ادخل السعر",
          '_somethingwrongdatepicker': "تاريخ خاطئ",
          '_somethingwrongTimepicker': "وقت خاطئ",

//Appointment_nurse
          '_Appointment List': "قائمة المواعيد",
          '_AppointmentTabs': "تقسيم المواعيد",
          '_Day': "اليوم",
          '_Booked': "محجوز",
          '_NoAppointment': "لا يوجد موعد",
          '_accepted': "مقبول",
          'refussed': "مرفوض",
          '_delayed': "مؤجل",
          'Dr': 'د/',
          //
          '_hello': 'اهلا',
          //Home
          '_applicationName': 'شــفـاء',
          '_chinese': "اللغة الصينية",
          '_hindi': "اللغة الهندية",
          '_spanish': "اللغة الأسبانيه",
          '_french': "اللغة الفرنسية",
          '_russian': "اللغة الروسية",
          '_german': "اللغة الألمانيه",
          '_italian': "اللغة الإيطاليه",

          '_medicalTeam': 'فريق طبي',

          '_professionalAffiliation': 'المؤهلات الحاصل عليها',
          '_professionalAffiliationNote':
              'ادخل كل المؤهلات والزمالات الحاصل عليها',
          '_professionalTitledetailsNote': 'ادخل الدرجة العلمية بالتفصيل ',
//////////////////////////////////////////////////////////////////////////
          '_availableTime': 'الوقت المتاح للطلب',
          '_graduationDate': 'اختر سنة التخرج',

          '_tabToSelect': 'اضغط للاختيار',
          '_graduationDate_': 'تاريخ التخرج؟',
          '_notSelected': 'لم يتم الاختيار',
          '_examinationFees': "سعر الكشف",
          '_lessThan50': "اقل من ٥٠ جنيه ",
          '_from50to100': "من ٥٠ الي١٠٠ جنيه",
          '_from100to200': "من ١٠٠ الي ٢٠٠ جنيه",
          '_from200to300': "من ٢٠٠ الي ٣٠٠ جنيه",
          '_graterThan300': "أكثر من ٣٠٠ جنيه",
          '_haveClinic?': "هل تملك او تعمل في عيادة",
          '_clinicAdd': "عنوان العيادة ",
          '_clinicName': "اسم العيادة ",

          '_clinicAddDetail': "ادخل العنوان بالتفصيل",
          '_aboutClinic': "عن العيادة",
          '_numberClinic': "رقم العيادة",

          '_aboutClinicField': "هل تقدم العيادة خدمات أخري؟",
          '_workArea': "أختر المنطقة اللي تعمل بها",

          '_workInHospital': "هل تعمل في مشتشفي؟",
          '_addHospital': "عنوان المستشفي",

          '_aboutToFinish': "اخر خطوة، لإنشاء ملف شخصي",
          '_professionLicense': "إضافة صورة من كارنيه النقابة",
          '_anyNotes': "هل لديك أي ملاحظات؟",
          '_requestSuccess': "طلب ناجح",
          '_exit': "Exit",
          '_requestSaved': "تم التسجيل بنجاح!...سيتم الرد في اقرب وثت",
          '_aboutNurse': "عن الممرض؟",
          '_nurseServices': "اختار الخدمات التي تستطيع تقديمها",
          '_nurseServicesselect': "اختار الخدمات التي تريدها ",
          '_selectLan': "اختر اللغات التي تستطيع التحدث بها",
          '_workingPlace': "حدد أين تعمل؟",
          '_anyServices': "هل تستطيع تقديم خدمات اخري؟",
          '_workAddress': "حدد عنوان العمل",

          '_hospital': 'مستشفي',
          '_clinic': 'عيادة',
          '_lab': 'معمل',
          '_noWork': 'لا اعمل',

          '_registeredNurse': 'أخصائي تمريض',
          '_nurseTech': 'فني تمريض',
          '_nurseAid': 'مساعد تمريض',
          '_aboutnurse': 'عن الممرض',
          '_requestdetails': 'تفاصيل الطلب',
          '_priceper': 'السعر لكل ساعة',
          '_addressdetails': 'تفاصيل العنوان',
          '_addressNote': 'ادخل العنوان بالتفصيل',
          '_Booking': 'حجز',
          '_createReport': "ادخل مشكلتك ",
        },
        'en': {
          //db
          'namecat': 'name_en',
          'lang': 'en',
          '_dateformat': 'ar_SU',
          'Accepted': 'Accepted',
          'Pending': 'Pending',
          'Cncelled': 'Cancelled',
          'bio': 'bio_en',
          'professional_title': 'professional_title_en',
          'clinical_name': 'clinical_name_en',
          'clinical_description': 'clinical_description_en',
          'clinical_address': 'clinical_address_en',
          'full_name': 'full_name_en',
          'education': 'nurse_edu_en',
          'another_services': 'another_services_en',
          'أخصائي تمريض': 'Registered nurse - Qualified nurse',
          'فني تمريض': 'Technical nurse - Nurse',
          'مساعد تمريض': 'Nurse aid',
          //my request page
          '_activity': 'Activity',
          '_visit': 'Home Visit',
          '_Advices': 'Advices',
          '_Advice': 'Advices',
          '_uploadPhotos': 'you didn\'t upload the files',

          //profile page
          '_Welcome': 'Welcome in Shefaa',
          "_Account": "Account",
          "_Favourite": "Favourite",
          "_Language": "Language",
          "_Rate": "Rate",
          "_About": "About",
          "_Logout": "Logout",
          ////////Medicine////////
          '_meddelete': 'Delete Medicine',
          '_meddone': 'Done',
          '_medinfo': 'Medicine Info',
          '_medclose': 'Close',
          '_addmed': 'Add Medicine',
          '_today': 'Today',
          '_medalart': 'Alart',
          '_medalartNote': 'Please enter all data',
          '_medunit': 'Unit',
          '_medamount': 'Amount',
          '_medaddnew': 'Add New',
          '_medname': 'Medicine Name',
          '_medtype': 'Medicine Type',
          '_meddose': 'Dose',
          '_medstartdate': 'Start Date',
          '_medstarttime': 'Start Time',
          '_medinterval': 'Interval',
          '_medduratoin': 'Duration',
          '_medsave': 'Save',
          '_confirmNote': 'Are you sure you want to ِِAccept this Request ?',

          '_rejectNote': 'Are you sure you want to Reject this Request ?',
          '_reject': 'Reject',

          ////////////////////////

          //Home
          '1': 'Home',
          '2': 'Add Medicines',
          '3': 'reminder of drugs and appointments',
          '4': 'Medical care',
          '5': 'communication with doctor or nurse',
          '6': 'Diabetes Prediction',
          '7': "Determine whether the patient has diabetes or not",
          '_yes': "Yes",
          '_no': "No",

          //to Do list
          '_createNote': "Create a new note!!",
          '_myNote': "My Note",
          '_add': "Add",
          '_cancel': "Cancel",
          '_update': "Update",
          '_toDo': "To Do List",
          '_deleteNote': "Delete Note",
          '_updateNote': "Update note",

          //Bottom Nav

          '_home': "Home",
          '_chats': "Chats",
          '_todayMessage': "Today's Message",
          //Drawer
          '_userName': "User Name",
          '_dashBoard': "DashBoard",
          '_settings': "Settings",
          '_addNotes': "Add Notes",
          '_logOut': "Log out",
          '_logIn': "Log in",
          '_reportAProblem': "Report a problem",
          //Settings

          '_editProfile': "Edit profile",
          '_themeMode': "DarkMode",
          '_notification': "Notification",
          '_chooseLanguage': "Choose Language",
          '_language': "Language",
          '_english': "English",
          '_arabic': "Arabic",
          '_notificationON': "Notification on",
          '_notificationOFF': "Notification Off",
          //sign
          '_pickFromGallery': " Pick from gallery",
          '_pickFromCamera': "Take a photo",

          '_alterImage': "Do you want to remove picture?",

          '_phoneRequired': "Phone Required",
          '_phoneNumber': "Phone number",
          '_selectYourCountry': "Select your country",
          '_female': "Female",
          '_male': "Male",
          '_both': 'both',
          '_egypt': "Egypt",
          '_other': "Other",
          '_selectYourGovernorate': "Select Governorate",
          '_selectYourCity': "Select neighborhood",
          '_selectFile': "Select File",
          '_uploadFile': "Upload File",
          '_signUp': "Sign Up",
          '_sign': "Sign",
          '_in': "In",
          '_registerAs': "Register as",

          '_doctor': "Doctor",
          '_nurse': "Nurse",
          '_user': "User",
          '_reportProblem': "Report",
          '_createReport': "Enter Your Problem",

          '_firstName': "Enter your First name",
          '_lastName': "Enter your last name",
          '_fullName': "Enter your full name in arabic as national id",
          '_email': "Enter your E-mail",
          '_passs': "Enter your password",
          '_id': "Enter your ID",
          '_phone': "Enter your phone number",
          '_ePhone': "Enter phone number in case there's any problem",
          '_birthdate': "Pick Your Birthdate",
          '_gender': "Select Gender",
          '_continue': "Continue",
          '_register': "Register",

          '_emptyField': "This field required!",
          '_validEmail': "Please enter a valid email address",
          '_error': "Error",
          '_sthWrong': "Something went wrong, please try again later.",

          '_shortPass': "Your password is too short",
          '_strongPass': "Your password is strong",
          '_greatPass': "Your password is great",
          '_Pass': "Enter strong password",
          '_reEnterPass': "Re-Enter the password",
          '_minPass': "Password must be at least 8 characters in length",

          '_forgotPassword': "Forgot Password ?",
          '_signAlso': "You can also Sign In With:",
          '_noAccount': "If you don't have an account ,you can",
          '_createOne': "Create one now!",
          '_noUser': "No user found for that email",
          '_wrongPass': "Wrong password provided for that user",

          '_change': "Change",
          '_aboutDoc': "About Doctor?",

//Medical Team Uploads
          '_professionalTitle': "Professional Degree",
          '_competeProfile': "Complete your profile",
          '_uploadPhoto': "Upload a photo for you",
          '_mainSpecialise': "Select your main specialise",
          '_subSpecialise': "Select your sub specialises",
          '_subSpecialiseNote':
              "if you don't have sub specialises, leave it empty",
          '_educationalQualification': "Educational Qualification",
          '_spokenLan': "Choose languages you could speak",
          '_arabicProfile': "In Arabic",
          '_englishProfile': "In English",
          '_arabicProfileTxt': "Complete your profile in Arabic",
          '_englishProfileTxt': "Complete your profile in English",

          '_all': 'All',
          '_professor': 'Professor',
          '_assistantProfessor': 'Assistant Professor',
          '_lecturer': 'Lecturer',
          '_assistantLecturer': 'Assistant Lecturer',
          '_specialist': 'Specialist',
          '_consultant': 'Consultant',
          'Professor': 'Professor',
          'AssistantProfessor': 'Assistant Professor',
          'Lecturer': 'Lecturer',
          'AssistantLecturer': 'Assistant Lecturer',
          'Specialist': 'Specialist',
          'Consultant': 'Consultant',

          '_submit': 'Submit',
          '_ok': 'OK',
          '_selectTopic': 'Select Topics',

//OnBoarding

          '_startNow': "Start now",
          '_controlDrugs': "Control your drugs",
          '_controlDrugsSub':
              "The application will also facilitate the task of organizing the types and dates of medicines that the patient takes throughout the day",
          '_medicalTeamBoard':
              "A platform to facilitate communication between patient,doctors and nurse",

//chat
          '_sendMessage': " Send Message",

//Doctors other data
          '_doctorName': "Doctor's Name",
          '_doctorSpecialise': "Doctor's Specialise",

//Nurse other data
          '_nurseName': "Nurser's Name",

//Dashboard
          '_doctorRequests': " Doctors' Requests",
          '_showAllDoctors': " Show all doctors",
          '_AllDoctors': "  All doctors",

          '_nurseRequests': " Nurses' Requests",
          '_showAllNurses': " Show all nurses",
          '_AllNurses': " All nurses",

          '_addTown': " Add A new town",
          '_dayTip': " Advice of the day",
          'top_rating': "Top Rating",

          //EditProfile
          '_save': "Save",
          '_updatePhoto': "Update photo",

//Homepage_nurse (Megz)
          '_homepage': "Home Page",
          '_MangeAppointments': "Mange Appointments",
          '_booked': 'Booked',
          '_unbooked': 'UnBooked',
          '_Control': "Control",
          '_MyProfile': "My Profile",
          '_Requests': "Requests",
          '_RequestsAccepted': "Requests Accepted",
          '_AddconsulationSchedule': "Add consulation Schedule",
          '_Appointments': "Appointments",
          '_CommentsAndRating': "Comments And Rating",
          '_Signout': "Sign out",

//profile_nurse
          '_Nurse': "Nurse",
          '_myprofile': "MY page",
          '_Home': "Home",
          '_Email': "Email",
          '_Phone': "Phone",
          '_WORKAT': "WORK AT",
          '_education': "Education",
          '_services': "Services",
          '_Title': "Title",
          '_birthday': "Birthday",
          '_category': "Category",
          '_Editprofile': "Edit profile",
          '_Updateprofile': "Updateprofile",

//Detailse_nurse
          '_Details': "Details",
          '_Date': "Date",
          '_Time': "Time",
          '_status': "status",
          '_Confirm': "Confirm",
          '_Finish': "Finish",
          '_Delete': "Delete",
          '_Success': "Success",
          '_RequestAccepted': "Request Accepted",
          '_RequestDeleted': "Request Deleted",

//Comments_nurse
          'R': "Comments List",
          '_Comments': "Comments",

//Nursenavigationbar
          '_requests': "requests",
          '_Chat': "Chat",
          '_Profile': "Profile",

//addapp_nurse
          '_AddAppointment': "Add Appointment",
          '_Price': "Price",
          '_EnterPrice': "Enter Price",
          '_somethingwrongdatepicker': "something wrong date picker",
          '_somethingwrongTimepicker': "something wrong Time picker",

//Appointment_nurse
          '_AppointmentList': "Appointment List",
          '_AppointmentTabs': "AppointmentTabs",
          '_Day': "Day",
          '_Booked': "Booked",
          '_NoAppointment': "No Appointment",
          '_accepted': "accepted",
          'refussed': "refussed",
          '_delayed': "delayed",
          'Dr': "Dr.",
          ////////////userhome page
          '_ShowAllSpecialties': 'Show All Specialties',
          '_Nursing': 'Nursing',
          '_doctoring': 'Doctors',
          '_hello': 'hello',
          'AM': 'AM',
          'PM': 'PM',
          '_searchin': 'Search in',
          '_allgovs': "All Governments",
          '_search': 'search your services',
          '_How': "How Can We Help You ?",
          '_popular': "popular categories",
          '_Heart': "Heart and Tear vessels",
          "Dentist": "Dental Surgeon",
          "Neurologist": "Brain & Nerves",
          "Bones": "Bones",
          "Eyes": "eyes",
          "All Categories": "All Categories",
          'Aboutt': "About doctor",
          "Doctors": "Doctors",
          "Place": "Place",
          'Filter': 'Filter',
          'Sort': 'Sort',
          "Title": "Title",
          "Gender": "Gender",
          "Vezeta": "Vezeta",

          //Home
          '_applicationName': 'Shefaa',
          //Bottom Nav

          '_medicalTeam': 'Medical Team',

          '_professionalAffiliation': 'Professional Affiliation',
          '_professionalAffiliationNote':
              'Share all your professional affiliation and memberships',
          '_professionalTitledetailsNote': 'mention your title in details',
          '_professionalTitledetails': 'Professional Title details',
//////////////////////////////////////////////////////////////////////////
          '_availableTime': 'When you will be available?',
          '_graduationDate': 'Pick the date of graduate:',

          '_tabToSelect': 'Tab to Select',
          '_graduationDate_': 'Graduation Date:  ',
          '_notSelected': 'Not Selected',
          '_examinationFees': "Examination Fees",
          '_lessThan50': "Less than 50 EGP",
          '_from50to100': "From 50 to 100 EGP",
          '_from100to200': "From 100 to 200 EGP",
          '_from200to300': "From 200 to 300 EGP",
          '_graterThan300': "Grater than 300 EGP",
          '_haveClinic?': "Do you have a clinic?",
          '_clinicAdd': "Clinic Address: ",
          '_clinicName': "Clinic Name: ",

          '_clinicAddDetail': "Enter Address in detail..",
          '_aboutClinic': "About Clinic:",
          '_numberClinic': "Clinic's Number",

          '_aboutClinicField': "Is there's other service in the clinic?",
          '_workArea': "Select the area you work in",

          '_workInHospital': "Are you working in Hospital",
          '_addHospital': "Hospital Address",

          '_aboutToFinish': "Last Step to create the account",
          '_professionLicense': "Upload Your Practicing License",
          '_anyNotes': "Do you have any Notes?",
          '_requestSuccess': "Request Successes!",
          '_exit': "Exit",
          '_requestSaved':
              "you registered successfully!.. we will reply response to you soon.",
          '_aboutNurse': "About Nurse?",
          '_nurseServices': "Select services you can do",
          '_nurseServicesselect': "Select services you want",
          '_selectLan': "Select languages you can speak",
          '_workingPlace': "Select the place you work In",
          '_chinese': "Chinese",
          '_hindi': "Hindi",
          '_spanish': "Spanish",
          '_french': "French",
          '_russian': "Russian",
          '_german': "German",
          '_italian': "Italian",
          '_anyServices': "can you provide another services?",
          '_workAddress': "Where do you work?",

          '_registeredNurse': 'Registered nurse - Qualified nurse',
          '_nurseTech': 'Technical nurse - Nurse',
          '_nurseAid': 'Nurse aid',
          '_hospital': 'Hospital',
          '_clinic': 'Clinic',
          '_lab': 'Laboratory',
          '_noWork': 'I have no work',
          '_aboutnurse': 'About nurse',
          '_requestdetails': 'Request details',
          '_priceper': 'Price per hour',
          '_addressdetails': 'Address details',
          '_adressNote': 'Enter Address in detail..',
          '_Booking': 'Booking',
        }
      };
}
