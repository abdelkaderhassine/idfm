import datetime

def Current_Time_Plus_10_Min(time_format):
    '''
    Deux formats possible: '%Hh%M' ou bien '%H:%M'
    '''
    current_time = datetime.datetime.now()
    new_time = current_time + datetime.timedelta(minutes=10)

    formatted_time = new_time.strftime(time_format)

    return formatted_time.replace('"', "")


def Extract_Departure_Times(trip_list):
    departure_times = []
    for trip in trip_list:
        parts = trip.split(',')
        for part in parts:
            if part.strip().startswith('Départ à'):
                time = part.split('Départ à')[1].strip()
                departure_times.append(time)
                break
    return departure_times


def Extract_Arrival_Times(trip_list):
    departure_times = []
    for trip in trip_list:
        parts = trip.split(',')
        for part in parts:
            if part.strip().startswith('Départ à'):
                time = part.split('Départ à')[1].strip()
                departure_times.append(time)
                break
    return departure_times