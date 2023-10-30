from django.urls import path
from . views import (PatientView, PatientUpdateView, 
                     MedicineView, MedicineUpdateView,
                     PrescriptionView, PrescriptionModifyView)

urlpatterns = [
    path('patient/', PatientView.as_view(), name='patient'),
    path('patient/<str:pk>/', PatientUpdateView.as_view(), name='patient_modify'),
    path('medicine/', MedicineView.as_view(), name='medicine'),
    path('medicine/<str:pk>/', MedicineUpdateView.as_view(), name='medicine'),
    path('prescription/', PrescriptionView.as_view(), name='prescription'),
    path('prescription/<str:pk>/', PrescriptionModifyView.as_view(), name='prescription_modify'),
]

