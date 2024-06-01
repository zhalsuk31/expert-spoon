#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ Alexey's salon ~~~~~\n"
 
# display available services
MAIN_MENU() {
AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
echo -e "\nHere are the available services:"
echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done
# ask what service they would like to choose
echo -e "\nWhat service would you like (enter a number)?"
read SERVICE_ID_SELECTED
}

MAIN_MENU

while [[ -z $($PSQL "select service_id from services where service_id=$SERVICE_ID_SELECTED") ]]
do
MAIN_MENU
done

echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE
CUSTOMER_ID=$($PSQL "select customer_id from  customers where phone = '$CUSTOMER_PHONE'")
  # if not found
if [[ -z $CUSTOMER_ID ]]
then
  # notify about abscence of the phone number in the database. And ask for a name
  echo -e "\nNumber not found. What is your name?"
  read CUSTOMER_NAME
  INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  CUSTOMER_ID=$($PSQL "select customer_id from  customers where phone = '$CUSTOMER_PHONE'")
else
CUSTOMER_NAME=$($PSQL "select name from  customers where customer_id = $CUSTOMER_ID")
fi
# ask what time would they like to have an appointment?
echo -e "\nWhat time would you like ot have an appointment?"
read SERVICE_TIME
INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
echo -e "\nI have put you down for a$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED") at $SERVICE_TIME, $CUSTOMER_NAME."



