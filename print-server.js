const express = require('express');
const cors = require('cors');
const net = require('net');

const app = express();
app.use(cors());
app.use(express.json());

app.post('/print', async (req, res) => {
  try {
    const { content, printerIP = '192.168.123.100' } = req.body;
    
    // Create a connection to the printer
    const client = new net.Socket();
    
    client.connect(9100, printerIP, () => {
      console.log(`Connected to printer at ${printerIP}`);
      
      // Basic ESC/POS commands
      const commands = [
        '\x1B\x40',          // Initialize printer
        '\x1B\x61\x01',      // Center alignment
        content,             // Print content
        '\x0A\x0A\x0A',      // Feed lines
        '\x1D\x56\x41\x03'   // Cut paper
      ].join('');
      
      client.write(commands, () => {
        client.destroy();
        res.send('Printing successful');
      });
    });

    client.on('error', (error) => {
      console.error('Printer connection error:', error);
      res.status(500).send('Printer connection failed');
    });

  } catch (error) {
    console.error('Print error:', error);
    res.status(500).send('Print failed');
  }
});

// New GET endpoint for test print
app.get('/test-print', (req, res) => {
  const client = new net.Socket();
  
  client.connect(9100, '192.168.123.100', () => {
    console.log('Connected to printer for test print');
    
    const testContent = 'Test Print\n\nIf you can read this,\nthe printer is working!\n\n';
    
    const commands = [
      '\x1B\x40',          // Initialize printer
      '\x1B\x61\x01',      // Center alignment
      testContent,         // Print test content
      '\x0A\x0A\x0A',      // Feed lines
      '\x1D\x56\x41\x03'   // Cut paper
    ].join('');
    
    client.write(commands, () => {
      client.destroy();
      res.send('Test print sent successfully');
    });
  });

  client.on('error', (error) => {
    console.error('Printer connection error during test print:', error);
    res.status(500).send('Printer connection failed during test print');
  });
});

// Listen on all network interfaces
app.listen(8080, '0.0.0.0', () => {
  console.log('Print server running on port 8080');
});