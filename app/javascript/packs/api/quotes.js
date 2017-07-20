import API from './base';

export default {
  getQuotes: () => {
    return API.get(`/quotes`);
  },

  createQuote: (content) => {
    return API.post(`/quotes`, { content: content });
  }
}
