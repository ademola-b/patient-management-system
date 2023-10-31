# Generated by Django 4.2.6 on 2023-10-31 07:47

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('pmsapp', '0003_remove_prescription_drugprescribed_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='prescription',
            name='drugprescribed',
        ),
        migrations.AddField(
            model_name='drugprescribed',
            name='prescription',
            field=models.ForeignKey(default=None, on_delete=django.db.models.deletion.CASCADE, to='pmsapp.prescription'),
        ),
    ]
