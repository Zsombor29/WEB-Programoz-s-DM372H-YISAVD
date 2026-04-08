import { useState } from 'react';
import './index.css';

function App() {
  const [orders, setOrders] = useState([]);
  const [name, setName] = useState('');
  const [quantity, setQuantity] = useState(1);

  const addOrder = () => {
    if (!name) return;
    setOrders([...orders, { name, quantity }]);
    setName('');
    setQuantity(1);
  };

  const deleteOrder = (index) => {
    const newOrders = orders.filter((_, i) => i !== index);
    setOrders(newOrders);
  };

  return (
    <div>
      <h1>🍕 Pizza King – React rendelés</h1>

      <input
        type="text"
        placeholder="Pizza neve"
        value={name}
        onChange={(e) => setName(e.target.value)}
      />

      <input
        type="number"
        min="1"
        value={quantity}
        onChange={(e) => setQuantity(parseInt(e.target.value))}
      />

      <button onClick={addOrder}>Hozzáadás</button>

      <ul>
        {orders.map((order, index) => (
          <li key={index}>
            {order.name} – {order.quantity} db
            <button onClick={() => deleteOrder(index)}>❌</button>
          </li>
        ))}
      </ul>
    </div>
  );
}

export default App;