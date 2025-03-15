# C$50 Finance Project
## Overview
C$50 Finance is a web application where users can manage their stock portfolios by buying and selling stocks. Users can view real-time stock prices, check their portfolio values, and execute simulated stock transactions. The application integrates with a stock database API to retrieve real-time stock prices and allows users to track their investments.

## Features
- User Authentication: Users can register and log in to manage their portfolios.
- Stock Lookup: Users can search for stocks by symbol and view their current prices.
- Buy Stocks: Users can purchase stocks by specifying a stock symbol and the number of shares they want to buy, given they have enough funds.
- Sell Stocks: Users can sell stocks from their portfolio and update their available balance.
- Portfolio Management: Users can view their portfolio, including the current value of owned stocks and total balance.
## Technologies Used
- Backend: Python, Flask
- Frontend: HTML, CSS (Bootstrap)
- Database: SQLite (finance.db)
- API: IEX Cloud for stock price lookup
## Requirements
- Python 3.x
- Flask
- SQLite
- Requests for API calls
## Installation
1. Clone the repository:
```bash
git clone https://github.com/yourusername/c50-finance.git
```
2. Install required dependencies:
```
pip install -r requirements.txt
```
3. Set up the database:
```
sqlite3 finance.db < schema.sql
```
4. Run the Flask application:
arduino
```
flask run
```
5.Navigate to `http://127.0.0.1:5000` in your browser to start using the application.

![image](https://github.com/user-attachments/assets/68ae6406-f408-4442-b93a-92a472f2ff8d)
