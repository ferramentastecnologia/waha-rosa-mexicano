# 📱 WAHA - Rosa Mexicano
## WhatsApp HTTP API (Cloud Deploy)

Este projeto faz deploy do WAHA (WhatsApp HTTP API) no Railway para o sistema de vouchers do Rosa Mexicano.

---

## 🚀 Deploy no Railway

### Opção 1: Via Dashboard Railway

1. Acesse: https://railway.app/new
2. Clique em **"Deploy from GitHub repo"**
3. Selecione este repositório: `waha-rosa-mexicano`
4. Railway vai detectar o `Dockerfile` automaticamente
5. Configure as variáveis de ambiente (veja abaixo)
6. Clique em **Deploy**

### Opção 2: Via CLI Railway

```bash
# 1. Instalar Railway CLI
npm i -g @railway/cli

# 2. Login
railway login

# 3. Deploy
cd waha-rosa-mexicano
railway init
railway up
```

---

## ⚙️ Variáveis de Ambiente no Railway

Configure estas variáveis no Railway:

```
WHATSAPP_API_KEY=rosa_mexicano_waha_2024
WHATSAPP_HOOK_URL=
WHATSAPP_HOOK_EVENTS=*
PORT=3000
```

**Opcional (para webhooks):**
```
WHATSAPP_HOOK_URL=https://rosa-mexicano-vouchers-production.up.railway.app/api/whatsapp-webhook
```

---

## 🔗 URLs Após Deploy

Após o deploy, você terá uma URL como:
```
https://waha-rosa-mexicano-production.up.railway.app
```

Use esta URL para configurar o backend dos vouchers.

---

## 📡 Conectar WhatsApp

### 1. Gerar QR Code

```bash
curl https://waha-rosa-mexicano-production.up.railway.app/api/sessions/default/auth/qr \
  -H "X-Api-Key: rosa_mexicano_waha_2024" \
  --output qr-code.png
```

### 2. Escanear com WhatsApp

1. Abra WhatsApp no celular
2. Vá em **Configurações** > **Aparelhos conectados**
3. Clique em **Conectar um aparelho**
4. Escaneie o QR Code gerado

### 3. Verificar Status

```bash
curl https://waha-rosa-mexicano-production.up.railway.app/api/sessions \
  -H "X-Api-Key: rosa_mexicano_waha_2024"
```

---

## 🧪 Testar Envio de Mensagem

```bash
curl -X POST https://waha-rosa-mexicano-production.up.railway.app/api/sendText \
  -H "X-Api-Key: rosa_mexicano_waha_2024" \
  -H "Content-Type: application/json" \
  -d '{
    "session": "default",
    "chatId": "5547992752697@c.us",
    "text": "Teste de mensagem via WAHA Cloud!"
  }'
```

---

## 🔧 Endpoints Principais

### Health Check
```
GET /health
```

### Listar Sessões
```
GET /api/sessions
Header: X-Api-Key: rosa_mexicano_waha_2024
```

### Obter QR Code
```
GET /api/sessions/default/auth/qr
Header: X-Api-Key: rosa_mexicano_waha_2024
```

### Enviar Mensagem de Texto
```
POST /api/sendText
Header: X-Api-Key: rosa_mexicano_waha_2024
Body: {
  "session": "default",
  "chatId": "5547XXXXXXXXX@c.us",
  "text": "Sua mensagem"
}
```

---

## 📊 Custos

### Railway:
- **Free Tier**: $5 crédito/mês (pode não ser suficiente)
- **Hobby Plan**: $5/mês (recomendado)
- **Pro Plan**: $20/mês

### Estimativa:
- WAHA roda 24/7
- Uso médio: ~$3-5/mês no Hobby Plan

---

## 🔄 Atualizar Backend

Após deploy do WAHA, atualize as variáveis no backend:

1. Acesse: https://railway.com/project/0437aa39-9bd4-494c-b9d2-794bb424ca5b
2. Serviço: `rosa-mexicano-vouchers`
3. Variables > Editar:

```
EVOLUTION_API_URL=https://waha-rosa-mexicano-production.up.railway.app
EVOLUTION_API_KEY=rosa_mexicano_waha_2024
EVOLUTION_INSTANCE=default
```

---

## ⚠️ Importante

- **Sessão WhatsApp**: Persiste no container (Railway tem volumes persistentes)
- **Reiniciar serviço**: QR Code precisa ser escaneado novamente
- **Backup**: Faça backup da sessão regularmente

---

## 📝 Troubleshooting

### WhatsApp desconecta constantemente
- Verifique se o Railway não está reiniciando o serviço
- Aumente o plano para garantir recursos suficientes

### QR Code não aparece
- Verifique se a porta 3000 está exposta
- Teste: `curl https://SEU-URL/health`

### Mensagens não enviam
- Verifique se a sessão está ativa: `GET /api/sessions`
- Verifique o formato do chatId: `5547XXXXXXXXX@c.us`

---

**Criado em:** 04/11/2025
**Versão WAHA:** latest (devlikeapro/waha)
**Deploy:** Railway
