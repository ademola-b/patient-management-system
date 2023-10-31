# Generated by Django 4.2.6 on 2023-10-31 00:25

from django.db import migrations, models
import django.db.models.deletion
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('pmsapp', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='prescription',
            name='dosage',
        ),
        migrations.RemoveField(
            model_name='prescription',
            name='drug',
        ),
        migrations.RemoveField(
            model_name='prescription',
            name='qty',
        ),
        migrations.AddField(
            model_name='prescription',
            name='payment_made',
            field=models.BooleanField(default=False),
        ),
        migrations.AlterField(
            model_name='prescription',
            name='date',
            field=models.DateField(auto_now_add=True),
        ),
        migrations.CreateModel(
            name='DrugPrescribed',
            fields=[
                ('drugpres_id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False, unique=True)),
                ('qty', models.IntegerField()),
                ('dosage', models.IntegerField()),
                ('total', models.FloatField()),
                ('drug', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='pmsapp.medicine')),
            ],
        ),
        migrations.AddField(
            model_name='prescription',
            name='drugprescribed',
            field=models.ForeignKey(default=None, on_delete=django.db.models.deletion.CASCADE, to='pmsapp.drugprescribed'),
        ),
    ]