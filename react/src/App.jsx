import React, { useState } from 'react';
import './style.css';   // ide már a style.css kell

function App() {
  const [orders, setOrders] = useState([]);
  const [pizza, setPizza] = useState('');
  const [quantity, setQuantity] = useState(1);

  const addOrder = () => {
    if (!pizza) return;
    setOrders([...orders, { pizza, quantity }]);
    setPizza('');
    setQuantity(1);
  };

  const removeOrder = (index) => {
    setOrders(orders.filter((_, i) => i !== index));
  };

  return (
    <div className="react-container">
      <h2>React rendelés – Pizza King</h2>

      <div className="order-form">
        <input 
          type="text" 
          placeholder="Pizza neve" 
          value={pizza} 
          onChange={(e) => setPizza(e.target.value)}
        />
        <input 
          type="number" 
          min="1" 
          value={quantity} 
          onChange={(e) => setQuantity(Number(e.target.value))}
        />
        <button onClick={addOrder}>Hozzáadás</button>
      </div>

      <div className="orders-list">
        <h3>Rendelések:</h3>
        {orders.length === 0 ? <p>Nincs rendelés.</p> : 
          <ul>
            {orders.map((order, i) => (
              <li key={i}>
                {order.pizza} – {order.quantity} db
                <button onClick={() => removeOrder(i)}>Törlés</button>
              </li>
            ))}
          </ul>
        }
      </div>
    </div>
  );
}

export default App;