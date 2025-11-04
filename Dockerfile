# WAHA (WhatsApp HTTP API) - Rosa Mexicano
# Deploy no Railway

FROM devlikeapro/waha:latest

# Variáveis de ambiente padrão
ENV WHATSAPP_HOOK_URL=""
ENV WHATSAPP_HOOK_EVENTS="*"
ENV WHATSAPP_API_KEY="rosa_mexicano_waha_2024"
ENV WHATSAPP_API_PORT=3000

# Expor porta
EXPOSE 3000

# O WAHA já tem um ENTRYPOINT definido na imagem base
# Não precisamos sobrescrever
