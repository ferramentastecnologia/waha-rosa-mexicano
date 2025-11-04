# WAHA (WhatsApp HTTP API) - Rosa Mexicano
# Deploy no Railway

FROM devlikeapro/waha:latest

# Variáveis de ambiente padrão
ENV WHATSAPP_HOOK_URL=""
ENV WHATSAPP_HOOK_EVENTS="*"
ENV WHATSAPP_API_KEY="rosa_mexicano_waha_2024"
ENV WHATSAPP_API_PORT=3000
ENV PORT=3000

# Railway precisa que a aplicação escute na variável $PORT
# WAHA usa WHATSAPP_API_PORT, então copiamos PORT para ela no startup

# Expor porta
EXPOSE 3000

# Garantir que WAHA use a porta correta no Railway
CMD ["sh", "-c", "WHATSAPP_API_PORT=${PORT:-3000} node dist/main"]
