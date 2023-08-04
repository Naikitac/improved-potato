#Naikita Commodore  
#July 23, 2023

# Import necessary libraries
import requests

#Define a function to obtain and display weather forecast data
def get_weather_forecast(location):
    try:
        # Replace with your own API key
        api_key = "22053b6592392950ca2b8e6e33cb8431"
        
        # Construct the URL for the API request
        url = f"http://api.openweathermap.org/data/2.5/weather?q={location}&appid={api_key}"
        
        # Send the API request and get the response
        response = requests.get(url)
        
        # Validate whether the user entered valid data
        if response.status_code != 200:
            print("Invalid location. Please try again.")
            return
        
        # Parse the JSON data from the response
        data = response.json()
        
        # Display the weather forecast to the user
        print("Weather forecast for", data["name"] + ":")
        print("Temperature:", data["main"]["temp"], "degrees Fahrenheit")
        print("Humidity:", data["main"]["humidity"], "%")
        print("Description:", data["weather"][0]["description"])
    
    except requests.exceptions.RequestException as e:
        # Print an error message if there's a connection issue
        print("Error: Unable to establish connection to the webservice.")

# Define the main function
def main():
    while True:
        # Ask the user for their zip code or city
        location = input("Please enter your zip code or city: ")
        
        # Call the function to get the weather forecast
        get_weather_forecast(location)
        
        # Allow the user to run the program multiple times
        run_again = input("Do you want to run the program again? (y/n) ")
        if run_again.lower() != "y":
            break

# Call the main function to start the program
if __name__ == "__main__":
    main()
