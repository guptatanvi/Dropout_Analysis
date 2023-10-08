# Copyright (c) 2018 The Regents of the University of Michigan
# and the University of Pennsylvania
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from collections import OrderedDict
import os
import subprocess
import logging
import requests
import csv
import pandas as pd

DATABASE_NAME = "course"
TEMP_DIR = "/temp-data/"


def execute_mysql_query(query, db_name):
    return requests.get('http://course_database_proxy/sql', data={"query": query, "db_name": db_name, "course_platform": "coursera"}).json()


def extract_coursera_sql_data(course, forum_comment_filename="forum_comments.csv", forum_post_filename="forum_posts.csv",assignment_filename="assignments.csv"):
    """
    Initialize the mySQL database, load files, and execute queries to deposit csv files of data into /input/course/session directory.
    :param course: course name.
    :param session: session id.
    :param forum_comment_filename: name of csv file to write forum comments data to.
    :param forum_post_filename: name of csv file to write forum posts to.
    :return:
    """
    logging.basicConfig(filename='/output/logs.log', level=logging.DEBUG)
    # query = """SELECT thread_id , post_time , b.session_user_id FROM forum_comments as a LEFT JOIN hash_mapping as b ON a.user_id = b.user_id WHERE a.is_spam != 1 ORDER BY post_time;"""
    subprocess.call("mkdir -p " + "/temp-data/" + course, shell=True)
    # forum_comments = execute_mysql_query(query, course)
    # df = pd.DataFrame(list(forum_comments[3]), columns=forum_comments[0:3])
    # df.to_csv(os.path.join(
    #     "/temp-data/" + course + '/', forum_comment_filename), index=False)
    # # execute forum post query and send to csv
    # query = """SELECT id , thread_id , post_time , a.user_id , public_user_id , session_user_id , eventing_user_id FROM forum_posts as a LEFT JOIN hash_mapping as b ON a.user_id = b.user_id WHERE is_spam != 1 ORDER BY post_time;"""
    # forum_posts = execute_mysql_query(query, course)
    # df = pd.DataFrame(list(forum_posts[7]), columns=forum_posts[0:7])
    # df.to_csv(os.path.join(
    #     "/temp-data/" + course + '/', forum_post_filename), index=False)
    
    query = """
            SELECT
            hm.session_user_id AS userID,
            a.submission_time,
            COALESCE (COUNT(a.raw_score), 0) AS number_of_attempts,
            AVG(a.raw_score) AS avg_raw_score,
            MAX(a.raw_score) AS max_raw_score,
            MIN(a.raw_score) AS min_raw_score
            FROM hash_mapping hm
            LEFT JOIN assignment_submission_metadata as a ON hm.session_user_id = a.session_user_id
            GROUP BY hm.session_user_id
            ORDER BY number_of_attempts DESC
            """
    
    assignments = execute_mysql_query(query, course)
    df = pd.DataFrame(list(assignments[6]), columns=assignments[0:6])
    df.to_csv(os.path.join(
        "/temp-data/" + course + '/', assignment_filename), index=False)
    return

"""
SELECT b.session_user_id, a.submission_time, a.raw_score, 
SUM(CASE WHEN a.raw_score IS NOT NULL THEN a.raw_score ELSE 0 END) / COUNT(CASE WHEN a.raw_score IS NOT NULL THEN 1 END) AS Mean_Score
FROM assignment_submission_metadata as a 
RIGHT JOIN hash_mapping as b 
ON a.session_user_id = b.session_user_id 
GROUP BY b.session_user_id 
ORDER BY submission_time;
"""

"""SELECT b.session_user_id, a.submission_time, a.raw_score FROM assignment_submission_metadata as a RIGHT JOIN hash_mapping as b ON a.session_user_id = b.session_user_id ORDER BY submission_time;"""

# query = """SELECT 1 as session_user_id,  submission_time, raw_score FROM assignment_submission_metadata;"""