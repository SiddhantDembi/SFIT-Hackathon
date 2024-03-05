from flask import Flask, render_template, request
import mysql.connector
from flask_bcrypt import Bcrypt

app = Flask(__name__)

db = mysql.connector.connect(host="localhost",
                             user="root",
                             passwd="Root@123",
                             database="farmeasy")
cursor = db.cursor()


@app.route("/")
def welcome():
    return render_template('index.html')


def pDashboardrender(farmer):
    cursor.execute(""" Select `product_id`, `qty_bought`, `farmer_status`, `book_id` from `bookings` where `farmer_id`='{}' """.format(farmer))
    return cursor.fetchall()

def productRender(productid):
    products = []
    for i in productid:
        cursor.execute(""" Select `product_id`, `product_name`, `product_rate` from `product_details` where
            `product_id`='{}' """.format(i))
        products.append(cursor.fetchall()[0])
    return products
def searching(search):
    cursor.execute(""" Select product_details.product_id, 
    product_details.product_name, product_details.product_qty, 
    product_details.product_rate, product_details.product_category, 
    product_details.product_desc, product_details.farmer_id, 
    farmer_details.user_id, user_data.name
    FROM((product_details inner join farmer_details on 
    product_details.farmer_id=farmer_details.farmer_id)  inner join user_data
    on farmer_details.user_id=user_data.user_id) 
    where product_details.product_name like '%{}%' """.format(search))
    return cursor.fetchall()

@app.route("/login")
def login():
    return render_template('login.html')


@app.route('/login_verify', methods=['GET', 'POST'])
def login_verify():
    if request.method == 'POST':
        email = request.form.get('email')
        password = request.form.get('password')
        cursor.execute("""Select * from `user_data` 
                    where `email`='{}' and `password`='{}' """.format(email, password))
        users = cursor.fetchall()
        if len(users) > 0:
            cursor.execute("""Select farmer_id from `farmer_details` 
                    where `user_id`='{}' """.format(users[0][0]))
            farmer = cursor.fetchall()
            if(farmer!=[]):
                return render_template('index.html', user=users[0][0], name=users[0][1], farmer=farmer[0][0])
            else:
                return render_template('index.html', user=users[0][0], name=users[0][1], farmer='NULL')
        else:
            return render_template('login.html')


@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        name = request.form.get('rusername')
        email = request.form.get('remail')
        password = request.form.get('rpassword')

        cursor.execute("""Insert into `user_data` (`user_id`, `name`, `email`, `password`)
                    Values(NULL,'{}', '{}', '{}')""".format(name, email, password))
        db.commit()
        return render_template('login.html')


@app.route('/dashboardpage/<user>/<name>')
def dashboardpage(user, name):
    # cursor.execute(""" Select product_details.product_name, 
    # product_details.product_rate, bookings.qty_bought 
    # bookings.customer_status from bookings inner join 
    # product_details on bookings.product_id=product_details.product_id 
    # where user_id='{}' """.format(user))
    # products = cursor.execute()
    return render_template('cDashboard.html', user=user, name=name)


@app.route('/dataentrypage/<user>/<name>')
def dataentrypage(user, name):
    cursor.execute(""" Insert into `farmer_details` (`farmer_id`, `user_id`)
                Values(NULL, '{}')""".format(user))
    db.commit()
    cursor.execute("""Select farmer_id from `farmer_details` 
                    where `user_id`='{}'""".format(user))
    farmer = cursor.fetchall()
    return render_template('dataentry.html', user=user, name=name, farmer=farmer[0][0])


@app.route('/dataentry/<user>/<name>/<farmer>', methods=['GET', 'POST'])
def dataentry(user, name, farmer):
    if request.method == 'POST':
        category = request.form.get('category')
        name = request.form.get('productname')
        description = request.form.get('description')
        amount = request.form.get('amount')
        price = request.form.get('price')
        cursor.execute(""" Insert into `product_details` (`product_id`, `product_name`, `product_qty`,
        `product_rate`, `product_category`, `product_desc`, `farmer_id`) 
        Values(NULL, '{}', '{}', '{}', '{}', '{}', '{}')""".format(name, amount, price, category, description, farmer))
        db.commit()

        bookings = pDashboardrender(farmer)
        productid = [i[0] for i in bookings]
        products = productRender(productid)
        return render_template('pDashboard.html', user=user, name=name, farmer=farmer)

@app.route('/pDashboard/<user>/<name>/<farmer>')
def render(user, name, farmer):
    bookings = pDashboardrender(farmer)
    productid = [i[0] for i in bookings]
    products = productRender(productid)
    finalproducts = [(j[1], j[2], i[1], i[2], i[3]) for i in bookings for j in products if i[0]==j[0]]
    return render_template('pDashboard.html', user=user, name=name, farmer=farmer, finalproducts=finalproducts)

@app.route('/activeorder/<user>/<name>/<farmer>/<bookid>', methods=['POST', 'GET'])
def deactivateorder(user, name, farmer, bookid):
    if request.method == 'POST':
        cursor.execute("""  UPDATE `bookings` SET `farmer_status` = '0' WHERE `book_id` = '{}' """.format(bookid))
        db.commit()
        bookings = pDashboardrender(farmer)
        productid = [i[0] for i in bookings]
        products = productRender(productid)
        finalproducts = [(j[1], j[2], i[1], i[2], i[3]) for i in bookings for j in products if i[0]==j[0]]
        return render_template('pDashboard.html', user=user, name=name, farmer=farmer, finalproducts=finalproducts)

@app.route('/staticSearch/<user>/<name>')
def staticSearch(user, name):
    return render_template('staticSearch.html', user=user, name=name)

@app.route('/dynamicsearch/<user>/<name>', methods=['POST', 'GET'])
def dynamicsearch(user, name):
    if request.method == 'POST':
        search = request.form.get('search')
        result = searching(search)
        print(result)
        return render_template('dynamicSearch.html', user=user, name=name, result=result)

@app.route('/product/<user>/<name>/<result>')
def productpage(user, name, result):
    return render_template('products.html', user=user, name=name, result=result)

@app.route('/transaction')
def proceed():
    return render_template('transaction.html')

if __name__ == "__main__":
    app.run(debug=True)



    # for i in userid:
    #     cursor.execute(""" Select * from `farmer_details` where 
    #     `farmer_id`='{}' """.format(i))
    #     userid.append(cursor.fetchall()[0])
    # finalproducts = [(i[0], i[1], i[2], i[3], i[4], i[5], i[6], j[1]) for i in productinfo for j in userid if i[6]==j[0]]