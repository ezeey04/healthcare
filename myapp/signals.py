from django.db.models.signals import post_save
from django.dispatch import receiver

from .backup import trigger_backup_async


@receiver(post_save, sender="myapp.booking")
def on_booking_saved(sender, instance, created, **kwargs):
    """
    Fires when a booking is created or its status is updated.
    Both are worth capturing immediately.
    """
    action = "booked" if created else f"updated to '{instance.status}'"
    print(f"[SIGNAL] Booking {instance.id} {action} -> backup queued")
    trigger_backup_async()


# @receiver(post_save, sender="myapp.Product")
# def on_product_saved(sender, instance, created, **kwargs):
#     trigger_backup_async()
#
# @receiver(post_delete, sender="myapp.Product")
# def on_product_deleted(sender, instance, **kwargs):
#     trigger_backup_async()
