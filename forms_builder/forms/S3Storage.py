import boto
from boto.s3.connection import S3Connection
from boto.s3.key import Key


class S3Storage(object):

    def __init__(self, bucket_name, s3_id, s3_key):
        self.s3_bucket_name = bucket_name
        self.s3_id = s3_id
        self.s3_key = s3_key

    def save(self, name, content):
        name = str(name.replace('/', '-').replace(' ', ''))
        connection = S3Connection(self.s3_id, self.s3_key)
        bucket = connection.get_bucket(self.s3_bucket_name)
        key = Key(bucket)
        key.key = name
        content.open()
        key.set_contents_from_file(content)
        return name