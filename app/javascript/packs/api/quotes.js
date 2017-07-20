import API from './base';

export default {
  getQuotes: () => {
    return API.get(`/quotes`);
  }
}
